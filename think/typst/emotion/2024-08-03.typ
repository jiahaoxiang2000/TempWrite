#import "../common.typ": *

== 2024-08-03 Love Formula

=== Love Formula

Love is often considered an abstract and intuitive concept, but it can be quantified using mathematical models. By evaluating the intensity of love between two individuals based on their personal behaviors and interactions, we can gain insights into the strength and stability of their relationship. This document presents a formal approach to quantify love using the Personal Behavior Affection (PBA) metric.

==== Identity and Behavior

The identity of a person can be represented by a set of behaviors. We can distinguish between different individuals by analyzing the probability distributions of their behaviors.

#definition[
  Let $A$ and $B$ be two individuals. The identity of individual $A$ is represented by a set of behaviors ${a_1, a_2, dots, a_n}$, and the identity of individual $B$ is represented by a set of behaviors ${b_1, b_2, dots, b_m}$. We distinguish between individuals $A$ and $B$ by the differences in the probability distributions of their behaviors.
]

#definition[
  The probability of individual $A$ exhibiting behavior $a_i$ is denoted as $P_A (a_i)$, and the probability of individual $B$ exhibiting behavior $b_j$ is denoted as $P_B (b_j)$. If $i = j$ and $a = b$, we compare $P_A (a_i)$ and $P_B (b_j)$ to distinguish between $A$ and $B$.
]

==== Personal Behavior Affection (PBA) Metric

The affection between the behaviors of two individuals can be evaluated using the Personal Behavior Affection (PBA) metric. This metric quantifies how the behavior of one individual influences the behavior of the other.

#definition[
  Let $A$ and $B$ be two individuals with distinct behaviors $a$ and $b$, respectively. The affection between their behaviors can be evaluated using the Personal Behavior Affection (PBA) metric, denoted as $"PB"(a, b)$:

  $ "PB"(a, b) = (P(a|b) - P(a))^2 $

  where $P(a|b)$ is the conditional probability of observing behavior $a$ given that behavior $b$ has been observed. This metric quantifies the influence of $b$ on $a$.
]

==== Intensity of Love

The intensity of love between two individuals can be defined as a function of their Personal Behavior Affection (PBA) metrics.

#definition[
  The intensity of love between two individuals $A$ and $B$ is denoted as $I(A, B)$, where $I(A, B) in RR$. It can be evaluated based on the following factors:

  $
    I(A, B) & = (sum_(i=1)^n sum_(j=1)^i "PB"(a_i, b_j)) / ((1+n)n\/2) \
            & = (sum_(i=1)^n sum_(j=1)^i (P(a_i | b_j) - P(a_i))^2) / ((1+n)n\/2)
  $

  where $"PB"(a_i, b_j)$ is the Personal Behavior Affection metric between behaviors $a_i$ and $b_j$, and $n$ is the number of discrete samples over the duration of time.
]

==== Example Calculation

Here we give a simple example to illustrate the calculation of the intensity of love between two individuals.

Consider two individuals, Alice and Bob, with the following behaviors:
- Alice: ${a_1, a_2, a_3}$, where $P(a_1) = 0.4$, $P(a_2) = 0.3$, and $P(a_3) = 0.3$.
- Bob: ${b_1, b_2, b_3}$.

The conditional probabilities of Alice's behaviors given Bob's behaviors are as follows:
- $P(a_1 | b_1) = 0.1$.
- $P(a_2 | b_1) = 0.2$, $P(a_2 | b_2) = 0.1$.
- $P(a_3 | b_1) = 0.3$, $P(a_3 | b_2) = 0.2$, $P(a_3 | b_3) = 0.1$.

The intensity of love between Alice and Bob can be calculated as follows:

$
  I("Alice", "Bob") & = (sum_(i=1)^3 sum_(j=1)^i (P(a_i | b_j) - P(a_i))^2) / ((1+3)3\/2) \
                    & = ((P(a_1 | b_1) - P(a_1))^2 + (P(a_2 | b_1) - P(a_2))^2 + (P(a_2 | b_2) - P(a_2))^2 \
                    & + (P(a_3 | b_1) - P(a_3))^2 + (P(a_3 | b_2) - P(a_3))^2 + (P(a_3 | b_3) - P(a_3))^2)\/6 \
                    & = ((0.1 - 0.4)^2 + (0.2 - 0.3)^2 + (0.1 - 0.3)^2 \
                    & + (0.3 - 0.3)^2 + (0.2 - 0.3)^2 + (0.1 - 0.3)^2)\/6 \
                    & = (0.09 + 0.01 + 0.04 + 0 + 0.01 + 0.04)\/6 \
                    & = 0.19\/6 \
                    & approx 0.03
$

Therefore, the intensity of love between Alice and Bob is approximately 0.03.

==== Properties of Love

Love has several interesting properties that can be analyzed mathematically. One such property is the symmetry (or lack thereof) of love.

#proposition[
  Love is not necessarily a symmetric relation. That is, $L(A, B) eq.not L(B, A)$.
]

#proof[
  To prove that love is not necessarily a symmetric relation, we need to show that there exists at least one pair $(A, B)$ such that $L(A, B)$ holds but $L(B, A)$ does not hold.

  Consider two individuals $A$ and $B$. Suppose $A$ loves $B$, which we denote as $L(A, B)$. However, this does not necessarily imply that $B$ loves $A$. In other words, $L(B, A)$ may not hold.

  For example, let $A$ be an individual who has expressed love towards $B$, but $B$ does not reciprocate this feeling. In this case, $L(A, B)$ is true, but $L(B, A)$ is false. Therefore, $L(A, B) eq.not L(B, A)$.

  This example demonstrates that love is not necessarily a symmetric relation.
]

==== Conclusion

By quantifying love using the Personal Behavior Affection (PBA) metric and analyzing its properties, we can gain a deeper understanding of the dynamics of relationships. This mathematical approach provides a framework for evaluating the intensity and stability of love between individuals.
