irt.report <-
function(answers, out, keys = NULL, itemtype='3PL', method = 'EM', optimizer = 'NR', verbose = F, test_score = T, test_info = T, test_SE = T, test_infoSE = T, trace = T, info = T, se = T, score = T, infoSE = T, infotrace = T)
{
  dir.create(saida, showWarnings = FALSE, recursive = TRUE)
  
  if(keys == NULL)
    teste = mirt(answers, model = 1, itemtype = itemtype, SE = T, SE.type = 'BL', method = method, optimizer = optimizer, verbose = verbose)
  else
  {
    teste = mirt(key2binary(answers, keys), model = 1, itemtype = itemtype, SE = T, SE.type = 'BL', method = method, optimizer = optimizer, verbose = verbose)
    nominal = mirt(answers, model = 1, itemtype = 'nominal', verbose = F)
  }
  
  print(teste)
  summary(teste)
  superpars = coef(teste, simplify = F)
  
  testplots=c()
  
  if(test_score) testplots = rbind(testplots, c('test_score', 'Curva do teste', 'score'))
  if(test_info) testplots = rbind(testplots, c('test_info', 'Curva de informação do teste', 'info'))
  if(test_SE) testplots = rbind(testplots, c('test_SE', 'Curva de erro padrão do teste', 'Curvas de informação/erro padrão do teste'))
  if(test_infoSE) testplots = rbind(testplots, c('test_infoSE', 'Curva do teste', 'infoSE'))
  
  for(i in 1:nrow(testplots))
  {
    print(plot(teste, type = testplots[i,3], main = testplots[i,2]))
    dev.copy2pdf(file = paste0(saida, testplots[i,1], '.pdf'))
  }
  
  pars = coef(teste, simplify = T)
  
  print(plot(density(pars$items[,1]), main = 'Densidade de a',
       ylab = 'Densidade', xlab = paste('N =', dim(pars$items[,1])[1])))
  dev.copy2pdf(file=paste0(saida, 'a.pdf'))
  
  print(plot(density(pars$items[,2]), main = 'Densidade de b',
       ylab = 'Densidade', xlab = paste('N =', dim(pars$items[,2])[1])))
  dev.copy2pdf(file=paste0(saida, 'b.pdf'))
  
  print(plot(density(pars$items[,3]), main = 'Densidade de c',
       ylab = 'Densidade', xlab = paste('N =', dim(pars$items[,3])[1])))
  dev.copy2pdf(file=paste0(saida, 'c.pdf'))
  
  print(pars)
  
  itemplots = c()
  
  if(trace) itemplots = rbind(itemplots, c('trace', 'Curva característica do item'))
  if(info) itemplots = rbind(itemplots, c('info', 'Curva de informação do item'))
  if(se) itemplots = rbind(itemplots, c('se', 'Erro padrão do item'))
  if(score) itemplots = rbind(itemplots, c('score', 'Curva de qtd. de acertos do item'))
  if(infoSE) itemplots = rbind(itemplots, c('infoSE', 'Curvas de informação/erro padrão do item'))  
  if(infotrace) itemplots = rbind(itemplots, c('infotrace', 'Curvas de informação/característica do item'))
  
  for(i in 1:ncol(respostas))
  {
    print(superpars[i])
    if(keys != NULL)
    {
      print(itemplot(nominal, i, type = 'trace', main = paste('Análise das alternativas do item', '-', i)))
      dev.copy2pdf(file = paste0(saida, 'distractor', '_', i, '.pdf'))
    }
    for(ii in 1:nrow(itemplots)){
      print(itemplot(teste, i, type = itemplots[ii, 1], main = paste(itemplots[ii, 2], '-', i)))
      dev.copy2pdf(file = paste0(saida, itemplots[ii, 1], '_', i, '.pdf'))
    }
  }
  
  write.table(pars$items[,1:3], file = paste0(saida, 'parametros.csv'), sep = ',', row.names = F)
  
  fits = itemfit(teste, X2 = T, method = 'ML')
  
  write.table(fits[,2:8], file = paste0(saida, 'medidas.csv'), sep = ',', row.names = F)
  return(teste)
}
