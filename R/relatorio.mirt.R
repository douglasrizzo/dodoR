relatorio.mirt <-
function(respostas, saida, itemtype='3PL', method = 'EM', optimizer = 'NR', verbose = F)
{
  dir.create(saida, showWarnings = FALSE, recursive = TRUE)
  teste = mirt(respostas, model = 1, itemtype = itemtype, SE = T, SE.type = 'BL', method = method, optimizer = optimizer, verbose = verbose)
  print(teste)
  summary(teste)
  superpars = coef(teste, simplify = F)
  
  filenames = c('test_score', 'test_info', 'test_SE', 'test_infoSE')
  charttitles = c('Curva do teste', 'Curva de informação do teste', 'Curva de erro padrão do teste', 'Curvas de informação/erro padrão do teste')
  charttypes = c('score', 'info', 'SE', 'infoSE')
  testplots = data.frame(filenames, charttitles, charttypes, stringsAsFactors = F)
  
  for(i in 1:nrow(testplots))
  {
    print(plot(teste, type = testplots[i,3], main = testplots[i,2]))
    dev.copy2pdf(file = paste0(saida, testplots[i,1],'.pdf'))
  }
  
  pars = coef(teste, simplify = T)
  
  print(plot(density(pars$items[,1]), main = 'Densidade de a',
       ylab = 'Densidade', xlab = paste('N =',dim(parametros)[1])))
  dev.copy2pdf(file=paste0(saida, 'a.pdf'))
  
  print(plot(density(pars$items[,2]), main = 'Densidade de b',
       ylab = 'Densidade', xlab = paste('N =',dim(parametros)[1])))
  dev.copy2pdf(file=paste0(saida, 'b.pdf'))
  
  print(plot(density(pars$items[,3]), main = 'Densidade de c',
       ylab = 'Densidade', xlab = paste('N =',dim(parametros)[1])))
  dev.copy2pdf(file=paste0(saida, 'c.pdf'))
  
  print(pars)
  
  filenames = c('info', 'se', 'trace', 'score', 'infoSE', 'infotrace')
  charttitles = c('Curva de informação do item', 'Erro padrão do item', 'Curva característica do item', 'Curva de qtd. de acertos do item', 'Curvas de informação/erro padrão do item', 'Curvas de informação/característica do item')
  charttypes = c('info','SE', 'trace', 'score', 'infoSE', 'infotrace')
  
  itemplots = data.frame(filenames, charttitles, charttypes, stringsAsFactors = F)
  
  for(i in 1:ncol(respostas))
  {
    print(superpars[i])
    for(ii in 1:nrow(itemplots)){
      print(itemplot(teste, i, type = itemplots[ii, 3], main = paste(itemplots[ii, 2], '-', i)))
      dev.copy2pdf(file = paste0(saida, itemplots[ii, 1], '_', i, '.pdf'))
    }
  }
  
  write.table(pars$items[,1:3], file = paste0(saida, 'parametros.csv'), sep = ',', row.names = F)
  
  fits = itemfit(teste, X2 = T, method = 'ML')
  
  write.table(fits[,2:8], file = paste0(saida, 'medidas.csv'), sep = ',', row.names = F)
  return(teste)
}
