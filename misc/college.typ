#import "@preview/basic-document-props:0.1.0": simple-page
#show: simple-page.with(
  "isomo",
  "",
  middle-text: "College preference",
  date: true,
  numbering: true,
  supress-mail-link: false,
)

#set text(
  font: (
    "Noto Sans CJK SC", // Primary Chinese font
    "Noto Serif CJK SC", // Alternative Chinese serif font
    "WenQuanYi Micro Hei", // Chinese fallback font
    "FZShuSong-Z01", // Traditional Chinese font
    "HYZhongSongJ", // Another Chinese font option
    "Noto Sans", // Latin fallback
    "Roboto", // Final fallback
  ),
  // lang: "zh",
  // region: "cn",
)

= College preference for brother

== Basic information

- region: Hunan
- year: 2025
- score: 468
- rank: 129,331
- subjects: physics, chemistry, geography

== submit timeline

- #link("https://jyt.hunan.gov.cn/jyt/sjyt/hnsjyksy/web/ksyzcfg/202506/t20250606_33693102.html") *submit announcement*
#table(
  columns: 2,
  [*event*], [*time*],
  [开通志愿填报系统辅助填报功能], [2025-06-22],
  [继续开通志愿填报系统辅助填报功能], [2025-06-28],
  [填报本科提前批艺术类平行组、本科批特殊类型中的高水平运动队、*本科批普通志愿*和专科提前批志愿],
  [2025-06-29 8:00 $arrow$ 07-02 17:00],

  [填报本科批普通类、体育类和职高对口类第一次征集志愿], [2025-07-16 8:00 $arrow$ 17:00],
  [填报本科批普通类、体育类和职高对口类第二次征集志愿], [2025-07-20 8:00 $arrow$ 17:00],
)

第四步：考生在填报志愿时间内登录系统，查询高校*招生章程、专业介绍、招生计划和历年分数*，结合本人高考成绩查询系统提供的志愿辅助填报参考信息，分类收藏院校或院校专业组，填写志愿草稿，提交保存正式志愿。

#table(
  columns: 3,
  [*score*], [*numberPeople*], [*rank*],
  [474], [1307], [121969],
  [473], [1270], [123239],
  [472], [1281], [124520],
  [471], [1313], [125833],
  [470], [1271], [127104],
  [469], [1353], [128457],
  [*468*], [*1316*], [*129773*],
  [467], [1304], [131077],
  [466], [1332], [132409],
  [465], [1311], [133720],
  [464], [1389], [135109],
  [463], [1279], [136388],
)




