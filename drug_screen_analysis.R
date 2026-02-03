
expr <- read.csv("Supplementary Table2 R1.csv",header = T) #need to change the .xlsx file to .csv file

##筛选重复值并去除重复值
library(dplyr)
expr <- expr %>%
    group_by(Product.Name) %>%
    summarise_all(mean)


library(ggplot2)
attach(expr)
ggplot(expr,aes(x =cvMG63.shRB1.meanLOG2,y=shRB1_NC_LOG2))+geom_point()

#install.packages("LSD") # Download package LSD
library(ggplot2)
library(viridis)
library(viridisLite)
library(ggpointdensity)
library(ggpubr)

my_palette <- c("#55C667FF","#73D055FF","#FDE725FF")
p1<-ggplot(data =expr , mapping = aes(x = cvMG63.shRB1.meanLOG2,
                                        y =shRB1_NC_LOG2))+ 
 # geom_abline(slope = 1,col="black")+
  geom_point(size=0.05,shape=16)+
  geom_pointdensity()+

 #密度散点图（geom_pointdensity）
#  scale_color_viridis() + 
  #geom_smooth(method = lm) +  ##省略拟合曲线
  stat_cor(method = "spearman") + 
 scale_color_viridis()+
 theme_bw() + 
  #coord_cartesian(xlim=c(0,15),ylim=c(0,15))+
  xlab("cvMG63.shRB1.meanLOG2") + 
  theme(axis.title.x = element_text(size = 16,
                                    face = "bold", 
                                    vjust = 0.5, 
                                    hjust = 0.5))+
  ylab("cvMG63.NC.meanLOG2") + 
  theme(axis.title.y = element_text(size = 16,
                                    face = "bold", 
                                    vjust = 0.5, 
                                    hjust = 0.5))+
  labs(title = "Correlation Plot \n n=2099")+
  theme_bw()+
  scale_x_continuous(limits = c(-6, 2)) + # 设置x轴范围为0到10  
  scale_y_continuous(limits = c(-6, 2)) +  # 设置y轴范围为-5到5
  coord_fixed() + # 保持x轴和y轴的比例，但允许它们根据数据范围缩放


  theme(legend.position = "right",plot.title = element_text(size = 16,hjust = 0.5),
    panel.grid.major=element_line(colour=NA),
        panel.background = element_rect(fill = "transparent",colour = NA),
        plot.background = element_rect(fill = "transparent",colour = NA),
        panel.grid.minor = element_blank(),
        text=element_text(size=16))
 # theme(legend.position='none')) ##去除legend
#p <- p + geom_point(aes(col = cyl))

ggsave(file = "MG63_shRB1LOG2+.pdf",height = 5,width = 6)


cor <- read.csv("MG63 shRB1 NC比值log2.csv",header = T)
library(dplyr)
cor <- cor %>%
    group_by(Product.Name) %>%
    summarise_all(mean)

cor <- cor[order(cor$cvMG63.NC.meanLOG2, decreasing=TRUE), ]

write.csv(cor , file = "HOS shRB1 NC.csv")

cor$name <- rownames(cor)

cor[,1] = cor[,3]
cor <- cor[,-3]

expr <- cor

my_palette <- c("#55C667FF","#73D055FF","#FDE725FF")

p<-ggplot(data =expr , mapping = aes(x = as.numeric(rownames(cor)),
                                        y = cvMG63.NC.meanLOG2))+ 
 # geom_abline(slope = 1,col="black")+
  geom_point(size=1.5,shape=16)+
  geom_pointdensity() + #密度散点图（geom_pointdensity）
  # 添加一条水平线
  geom_hline(aes(yintercept=0.004))+
#  scale_color_viridis() + 
  #geom_smooth(method = lm) +  ##省略拟合曲线
  stat_cor(method = "spearman") + 
 scale_color_viridis()+
  #coord_cartesian(xlim=c(0,15),ylim=c(0,15))+
  xlab("Drug Name") + 
  theme(axis.title.x = element_text(size = 16,
                                    face = "bold", 
                                    vjust = 0.5, 
                                    hjust = 0.5))+
  ylab("cvMG63.shRB1.mean/cvMG63.NC.mean)") + 
  theme(axis.title.y = element_text(size = 16,
                                    face = "bold", 
                                    vjust = 0.5, 
                                    hjust = 0.5))+
  labs(title = "Correlation Plot \n n=2099")+
  theme_bw()+
  ylim(-4, 4)+
  #coord_fixed() + # 保持x轴和y轴的比例，但允许它们根据数据范围缩放
  theme(legend.position = "right",plot.title = element_text(size = 16,hjust = 0.5),
    panel.grid.major=element_line(colour=NA),
        panel.background = element_rect(fill = "transparent",colour = NA),
        plot.background = element_rect(fill = "transparent",colour = NA),
        panel.grid.minor = element_blank(),
        text=element_text(size=16))

 # theme(legend.position='none')) ##去除legend

ggsave(file = "MG63_shRB1/NC+.pdf",height = 5,width = 6)







