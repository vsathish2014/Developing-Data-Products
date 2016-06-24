library(shiny) 

BMI<-function(weight,height) {weight/(height^2)}

bmi_f<-function(weight,height){
  BMI_value<-weight/(height^2)
  ifelse(BMI_value<18.5,"Underweight",ifelse(BMI_value<25,"Normal weight",ifelse(BMI_value<30,"overweight","Obesity")))
}

shinyServer(
  function(input, output) {
    
    output$inputweightvalue <- renderPrint({input$weight})
    output$inputheightvalue <- renderPrint({input$height})
    output$estimation <- renderPrint({BMI(input$weight,input$height)})
    output$bmi <- renderPrint({bmi_f(input$weight,input$height)})
  } 
)