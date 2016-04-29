require('nnet')
d <- read.csv('cleanData.csv')
g_1 <- multinom(formula = Answer~1, data=d) # No explanatory variables
g_2 <- multinom(formula = Answer~Conf+Corr, data = d) # Confidence + Correctness
g_3 <- multinom(formula = Answer~Conf*Corr, data = d) # Interaction term added
anova(g_1, g_2, g_3)
#         Model Resid. df Resid. Dev   Test    Df  LR stat.    Pr(Chi)
# 1           1        92   70.64550           NA        NA         NA
# 2 Conf + Corr        88   58.29064 1 vs 2     4 12.354866 0.01489855
# 3 Conf * Corr        86   55.14119 2 vs 3     2  3.149447 0.20706485

m_1 <- multinom(formula = Answer~1, filter(d, Corr=='M'))
m_2 <- multinom(formula = Answer~Conf, filter(d, Corr=='M'))
anova(m_1, m_2)
#   Model Resid. df Resid. Dev   Test    Df LR stat.   Pr(Chi)
# 1     1        44   21.63085           NA       NA        NA
# 2  Conf        42   20.08844 1 vs 2     2 1.542412 0.4624551

a_1 <- multinom(formula = Answer~1, filter(d, Corr=='A'))
a_2 <- multinom(formula = Answer~Conf, filter(d, Corr=='A'))
anova(a_1, a_2)
#   Model Resid. df Resid. Dev   Test    Df LR stat.    Pr(Chi)
# 1     1        46   40.15513           NA       NA         NA
# 2  Conf        44   35.05273 1 vs 2     2   5.1024 0.07798803