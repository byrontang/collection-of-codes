# Indicate a set of factors as a vector
hobby <- c('similarHobby', 'diffrentHobby')
occupation <- c('similarOccupation', 'diffrentOccupation')
travel <- c('common', 'uncommon')
discount <- c('no', '20%')
distance <- c('lessThan25','25to100','moreThan100')

# Combine all the vectors as a list
allFactors <- list(hobby, occupation, travel, discount, distance)

# Create all possible combination
for (i in c(1:(length(allFactors)-1))){
  if (i == 1){
    grid1 <- expand.grid(unlist(allFactors[i]), unlist(allFactors[i+1]))
  }else{
    grid1 <- expand.grid(combList, unlist(allFactors[i+1]))
  }
  combList <- paste(grid1$Var1, ',', grid1$Var2)
}

combination <- data.frame(do.call('rbind', strsplit(as.character(combList),',')))

# Order from left to right and rename columns
combination_sorted <- arrange(combination, X1, X2, X3, X4)
names(combination_sorted) <- c('hobby', 'occupation', 'travel', 'discount', 'distance')

# Write to excel
library(xlsx)
write.xlsx(combination_sorted, "C:/Users/byron/Documents/UMN/MSBA 6440 Data-Driven Experimentation and Measurement/Assignment1/fullFactorialDesign.xlsx")