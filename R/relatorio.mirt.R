relatorio.mirt <-
function(respostas, saida, itemtype='3PL', method = 'EM', optimizer = 'NR', verbose = T)
{
  dir.create(saida, showWarnings = FALSE, recursive = TRUE)
  teste = mirt(respostas, model = 1, itemtype = itemtype, SE = T, SE.type = 'BL', method = method, optimizer = optimizer, verbose = verbose)
  print(teste)
  summary(teste)
  pars = print(coef(teste, simplify = T))
  print(coef(teste, simplify = F))
  
  filenames = c('test_score', 'test_info', 'test_SE', 'test_infoSE')
  charttitles = c('Curva do teste', 'Curva de informação do teste', 'Curva de erro padrão do teste', 'Curvas de informação/erro padrão do teste')
  charttypes = c('score', 'info', 'SE', 'infoSE')
  testplots = data.frame(filenames, charttitles, charttypes, stringsAsFactors = F)
  
  for(i in 1:nrow(testplots))
  {
    pdf(file = paste0(saida, testplots[i,1],'.pdf'))
    plot(teste, type = testplots[i,3], main = testplots[i,2])
    dev.off()
  }
  
  filenames = c('info', 'se', 'trace', 'score', 'infoSE', 'infotrace')
  charttitles = c('Curva de informação do item', 'Erro padrão do item', 'Trace do item', 'Curva de qtd. de acertos do item', 'Curvas de informação/erro padrão do item', 'Curvas de informação/trace do item')
  charttypes = c('info','SE', 'trace', 'score', 'infoSE', 'infotrace')
  
  itemplots = data.frame(filenames, charttitles, charttypes, stringsAsFactors = F)
  
  for(i in 1:ncol(respostas))
  {
    for(ii in 1:nrow(itemplots)){
      pdf(file = paste0(saida, testplots[i,1],'.pdf'))
      plot(teste, type = testplots[i,3], main = testplots[i,2])
      itemplot(teste, i, type = itemplots[i,3], main = paste(itemplots[i,2], '-', i))
      dev.off()
    }
  }
  
  write.table(pars$items[,1:3], file = paste0(saida, 'parametros.csv'), sep = ',', row.names = F)
  
  fits = itemfit(teste, X2 = T, method = 'ML')
  write.table(fits[,2:8], file = paste0(saida, 'medidas.csv'), sep = ',', row.names = T)
  return(teste)
}
