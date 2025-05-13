# %% import the data
import pandas as pd

# Load the Excel file
# Read all sheets into a dictionary of DataFrames
excel_file = pd.ExcelFile('../temp/scorce.xlsx')
sheet_names = excel_file.sheet_names

# Remove the first three rows from each sheet before concatenating
df_list = [excel_file.parse(sheet_name).iloc[2:] for sheet_name in sheet_names]
df = pd.concat(df_list, ignore_index=True)

#%%
# Add missing columns to the DataFrame if they do not exist
columns_title = [
    "学校", "班级", "总人数", "统分人数", "科目", "人均分总分", "科均分", "20%得分",
    "及格率及格人数", "及格率(%)", "30%得分", "优秀率优秀人数", "优秀率(%)", "25%得分",
    "后30%分率人数", "后30%人均分", "25%得分", "综合得分", "排名", "教师"
]

# base on the columns_title to name the columns
df.columns = columns_title

# Remove rows where all values are null
df = df.dropna(how='all')

# Save the DataFrame to a new CSV file
df.to_csv('../temp/score.csv', index=False)

# %%
# 过滤出中心小学的数据
central_school_df = df[df['学校'] == '中心小学']

# 从班级列提取年级信息（假设格式为"X年级"或"XX班"，其中X是年级数字）
def extract_grade(class_name):
    if '年级' in str(class_name):
        return str(class_name)[0] + '年级'
    elif '班' in str(class_name):
        return str(class_name)[0] + '年级'
    return class_name

central_school_df['年级'] = central_school_df['班级'].apply(extract_grade)

# 按年级和科目分组进行教学质量分析
grouped_data = central_school_df.groupby(['年级', '科目']).agg({
    '教师': 'count',
    '科均分': 'mean',
    '及格率(%)': 'mean',
    '优秀率(%)': 'mean',
    '综合得分': 'mean',
    '后30%分率人数': 'mean'
}).reset_index()
grouped_data.columns = ['年级', '科目', '教师数量', '科均分', '平均及格率', '平均优秀率', '平均综合得分', '平均后30%分率人数']
grouped_data.to_csv('../temp/中心小学教学质量分析.csv', index=False)

# 中心小学各年级整体汇总
central_grade_summary = central_school_df.groupby('年级').agg({
    '科均分': 'mean',
    '及格率(%)': 'mean',
    '优秀率(%)': 'mean',
    '综合得分': 'mean',
    '后30%分率人数': 'mean'
}).reset_index()
central_grade_summary.columns = ['年级', '科均分', '平均及格率', '平均优秀率', '平均综合得分', '平均后30%分率人数']
central_grade_summary.to_csv('../temp/中心小学各年级整体汇总.csv', index=False)

# 中心小学各科目整体汇总
central_subject_summary = central_school_df.groupby('科目').agg({
    '科均分': 'mean',
    '及格率(%)': 'mean',
    '优秀率(%)': 'mean',
    '综合得分': 'mean',
    '后30%分率人数': 'mean'
}).reset_index()
central_subject_summary.columns = ['科目', '科均分', '平均及格率', '平均优秀率', '平均综合得分', '平均后30%分率人数']
central_subject_summary.to_csv('../temp/中心小学各科目整体汇总.csv', index=False)

# 中心小学各年级各科目详细对比
central_grade_subject_summary = central_school_df.groupby(['年级', '科目']).agg({
    '科均分': 'mean',
    '及格率(%)': 'mean',
    '优秀率(%)': 'mean',
    '综合得分': 'mean',
    '后30%分率人数': 'mean'
}).reset_index()
central_grade_subject_summary.columns = ['年级', '科目', '科均分', '平均及格率', '平均优秀率', '平均综合得分', '平均后30%分率人数']
central_grade_subject_summary.to_csv('../temp/中心小学年级科目对比.csv', index=False)

# 中心小学教师对比（各教师整体表现）
central_teacher_summary = central_school_df.groupby('教师').agg({
    '科均分': 'mean',
    '及格率(%)': 'mean',
    '优秀率(%)': 'mean',
    '综合得分': 'mean',
    '后30%分率人数': 'mean'
}).reset_index()
central_teacher_summary.columns = ['教师', '科均分', '平均及格率', '平均优秀率', '平均综合得分', '平均后30%分率人数']
central_teacher_summary.to_csv('../temp/中心小学教师整体汇总.csv', index=False)

# 中心小学教师-科目对比（各教师在各科目表现）
central_teacher_subject_summary = central_school_df.groupby(['教师', '科目']).agg({
    '科均分': 'mean',
    '及格率(%)': 'mean',
    '优秀率(%)': 'mean',
    '综合得分': 'mean',
    '后30%分率人数': 'mean'
}).reset_index()
central_teacher_subject_summary.columns = ['教师', '科目', '科均分', '平均及格率', '平均优秀率', '平均综合得分', '平均后30%分率人数']
central_teacher_subject_summary.to_csv('../temp/中心小学教师科目对比.csv', index=False)

# 比较中心小学与其他学校
other_school_df = df[df['学校'] != '中心小学']
other_school_df['年级'] = other_school_df['班级'].apply(extract_grade)
central_school_df_with_type = central_school_df.copy()
central_school_df_with_type['学校名称'] = '中心小学'
other_school_df['学校名称'] = other_school_df['学校']

comparison_df = pd.concat([
    central_school_df_with_type,
    other_school_df
])

comparison_grouped = comparison_df.groupby(['学校名称', '年级', '科目']).agg({
    '科均分': 'mean',
    '及格率(%)': 'mean',
    '优秀率(%)': 'mean',
    '综合得分': 'mean',
    '后30%分率人数': 'mean'
}).reset_index()
comparison_grouped.columns = ['学校名称', '年级', '科目', '科均分', '平均及格率', '平均优秀率', '平均综合得分', '平均后30%分率人数']
comparison_grouped.to_csv('../temp/中心小学与其他学校对比分析.csv', index=False)

# 各学校整体汇总
school_summary = df.groupby('学校').agg({
    '科均分': 'mean',
    '及格率(%)': 'mean',
    '优秀率(%)': 'mean',
    '综合得分': 'mean',
    '后30%分率人数': 'mean'
}).reset_index()
school_summary.columns = ['学校',  '科均分', '平均及格率', '平均优秀率', '平均综合得分', '平均后30%分率人数']
school_summary.to_csv('../temp/各学校整体汇总.csv', index=False)

# 各年级整体汇总
df['年级'] = df['班级'].apply(extract_grade)
grade_summary = df.groupby('年级').agg({
    '科均分': 'mean',
    '及格率(%)': 'mean',
    '优秀率(%)': 'mean',
    '综合得分': 'mean',
    '后30%分率人数': 'mean'
}).reset_index()
grade_summary.columns = ['年级',  '科均分', '平均及格率', '平均优秀率', '平均综合得分', '平均后30%分率人数']
grade_summary.to_csv('../temp/各年级整体汇总.csv', index=False)

# 各科目整体汇总
subject_summary = df.groupby('科目').agg({
    '科均分': 'mean',
    '及格率(%)': 'mean',
    '优秀率(%)': 'mean',
    '综合得分': 'mean',
    '后30%分率人数': 'mean'
}).reset_index()
subject_summary.columns = ['科目',  '科均分', '平均及格率', '平均优秀率', '平均综合得分', '平均后30%分率人数']
subject_summary.to_csv('../temp/各科目整体汇总.csv', index=False)

# 每个教师的表现分析
teacher_performance = central_school_df.groupby(['科目','教师']).agg({
    '综合得分': 'mean',
    '及格率(%)': 'mean',
    '优秀率(%)': 'mean'
}).reset_index()

teacher_performance.columns = ['科目','教师','平均综合得分', '平均及格率', '平均优秀率']
teacher_performance.to_csv('../temp/中心小学教师表现分析.csv', index=False)

# %%

