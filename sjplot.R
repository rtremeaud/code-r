library(sjPlot)
data(efc)
sjp.xtab(efc$e16sex, efc$e42dep)
variables <- sji.getVariableLabels(efc)
valeurs <- sji.getValueLabels(efc)
# simple frequency table
sjt.frq(efc$e42dep,
        variableLabels=variables['e42dep'],
        valueLabels=valeurs[['e42dep']])
       sjt.frq(efc$e42dep,
        variableLabels=variables['e42dep'],
        valueLabels=valeurs[['e42dep']])
        
        
        
        