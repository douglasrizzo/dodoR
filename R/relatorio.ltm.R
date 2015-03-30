relatorio.ltm <-
function(respostas, saida, type = 'latent.trait', IRT.param = T, max.iter = 10)
{
  nItens=ncol(respostas)
  colnames(respostas) = paste0('item ', 1:nItens)
  
  print(paste0('Nº examinandos: ', nrow(respostas)))
  
  print(paste0('calculando parâmetros ', Sys.time()))
  
  teste = NULL
  resumo = NULL
  iter = 1
  while(is.null(resumo) || iter != max.iter){
  tryCatch(
  {
    iter++
    teste = tpm(respostas, type = type, IRT.param = IRT.param,
                start.val = 'random', na.action = na.exclude)
    resumo = summary(teste)
  },
  error = function(e)
  {
    print(e$message) # or whatever error handling code you want
  }
  )}
  
  print(resumo)
  
  parametros = data.frame(a=resumo$coefficients[((nItens*2)+1):(nItens*3), 1],
                          b=resumo$coefficients[(nItens+1):(nItens*2), 1],
                          c=resumo$coefficients[1:nItens, 1],
                          row.names=NULL)
  erros = data.frame(a=resumo$coefficients[((nItens*2)+1):(nItens*3), 2],
                     b=resumo$coefficients[(nItens+1):(nItens*2), 2],
                     c=resumo$coefficients[1:nItens,2],
                     row.names=NULL)
  zs = data.frame(a=resumo$coefficients[((nItens*2)+1):(nItens*3), 3],
                     b=resumo$coefficients[(nItens+1):(nItens*2), 3],
                     c=resumo$coefficients[1:nItens, 3],
                     row.names=NULL)
  
 dir.create(saida, showWarnings = FALSE, recursive = TRUE)
  
 for(i in 1:nItens){
   pdf(file=paste0(saida, 'cci_', i, '.pdf'))
   plot(teste, type = 'ICC', items = i,
        xlab = 'Habilidade', ylab = 'Probabilidade',
        main = paste0('CCI - item ', i))
   dev.off()
   pdf(file=paste0(saida, 'cii_', i, '.pdf'))
   plot(teste, type = 'IIC', items = i, annot = T,
        xlab = 'Habilidade', ylab = 'Informação',
        main = paste0('Curva de Informação - item ', i))
   dev.off()
 }
  
  pdf(file=paste0(saida, 'cci_teste.pdf'))
  plot(teste, type = 'IIC', items = 0, annot = T,
       xlab = 'Habilidade', ylab = 'Informação',
       main = 'Curva de informação do teste')
  dev.off()
  
  print('Parâmetros:')
  print(summary(parametros))
  
  pdf(file=paste0(saida, 'a.pdf'))
  plot(density(parametros[,1]),main = 'Densidade de a',
       ylab = 'Densidade', xlab = paste('N =',dim(parametros)[1]))
  dev.off()
  
  pdf(file=paste0(saida, 'b.pdf'))
  plot(density(parametros[,2]),main = 'Densidade de b',
       ylab = 'Densidade', xlab = paste('N =',dim(parametros)[1]))
  dev.off()
  
  pdf(file=paste0(saida, 'c.pdf'))
  plot(density(parametros[,3]),main = 'Densidade de c',
       ylab = 'Densidade', xlab = paste('N =',dim(parametros)[1]))
  dev.off()
  
  print('Erros:')
  print(summary(erros))
  print('Zs:')
  print(summary(zs))
  
  print(paste('Salvando parâmetros', Sys.time()))
  
  write.table(parametros, file = paste0(saida, 'parametros.csv'),
              sep = ',', row.names = F)
  write.table(erros, file = paste0(saida, 'erros.csv'),
              sep = ',', row.names = F)
  write.table(zs, file = paste0(saida, 'zs.csv'),
              sep = ',', row.names = F)
}
