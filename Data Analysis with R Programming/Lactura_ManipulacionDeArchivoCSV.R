---
  title: "Lesson 3: Cleaning data"
output: html_document
---
  
## Background for this activity
  
## The scenario

# En este escenario, usted es un analista de datos junior que trabaja para una empresa de reservas de hoteles. Se te ha pedido que
#limpiar un archivo .csv que se cre� despu�s de consultar una base de datos para combinar dos tablas diferentes de diferentes
#hoteles. Para obtener m�s informaci�n sobre estos datos, necesitar� utilizar funciones para obtener una vista previa de los datos.
#estructura, incluidas sus columnas y filas. Tambi�n necesitar� utilizar funciones b�sicas de limpieza para preparar este
#data para an�lisis. 

## Step 1: Load packages

#Para comenzar a limpiar sus datos, deber� instalar los paquetes requeridos.
#Si ya ha instalado y cargado `tidyverse`,` skimr` y `janitor` en esta sesi�n.

```{r}
install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")
```

# Una vez que se instala un paquete, puede cargarlo ejecutando la `biblioteca ()`
# funci�n con el nombre del paquete entre par�ntesis:

```{r}
library(tidyverse)
library(skimr)
library(janitor)
```

## Step 2: Import data


```{r}
bookings_df <- read_csv("hotel_bookings.csv")
```

## Paso 3: Conozca sus datos

#Antes de comenzar a limpiar sus datos, t�mese un tiempo para explorarlos. Puedes usar
#varias funciones con las que ya est� familiarizado para obtener una vista previa de sus datos,
#incluyendo la funci�n `head ()` en el fragmento de c�digo a continuaci�n:

```{r}
head(bookings_df)
```

# Tambi�n puede resumir u obtener una vista previa de los datos con `str ()` y `glimpse ()`
#functions para comprender mejor los datos ejecutando los siguientes fragmentos de c�digo:


```{r}
str(bookings_df)
```

```{r}
glimpse(bookings_df)
```

# Tambi�n puede usar `colnames ()` para verificar los nombres de las columnas en su conjunto de datos.
# Ejecute el fragmento de c�digo a continuaci�n para averiguar los nombres de las columnas en este conjunto de datos:

```{r}
colnames(bookings_df)
```

#Algunos paquetes contienen funciones m�s avanzadas para resumir y explorar su
#datos. Un ejemplo es el paquete `skimr`, que tiene varias funciones para este
#objetivo. Por ejemplo, la funci�n `skim_without_charts ()` proporciona un resumen detallado
# de los datos. Intente ejecutar el siguiente c�digo:

```{r}
skim_without_charts(bookings_df)
```

## Step 4: Cleaning your data

# Seg�n las funciones que ha utilizado hasta ahora, �c�mo describir�a sus datos?
#en un resumen para sus partes interesadas? Ahora, digamos que est� interesado principalmente en
#las siguientes variables: 'hotel', 'is_canceled' y 'lead_time'. Crear un nuevo
# marco de datos con solo esas columnas, llam�ndolo `trimmed_df` agregando los 
#nombres de las variables a este fragmento de c�digo: 
 
 ```{r}
trimmed_df <- bookings_df %>% 
  select(is_canceled,lead_time, trimmed_df)
```

# Puede notar que algunos de los nombres de las columnas no son muy intuitivos, por lo que
# querr� cambiarles el nombre para que sean m�s f�ciles de entender. Tu podr�as querer
# cree el mismo marco de datos exacto que el anterior, pero cambie el nombre de la variable 'hotel' para que sea
# named 'hotel_type' para ser muy claro sobre de qu� se tratan los datos

#Complete el espacio a la izquierda del s�mbolo '=' con el nuevo nombre de la variable:

```{r}
trimmed_df %>% 
  select(hotel, is_canceled, lead_time) %>% 
  rename(hotel_type = hotel)
```

#Otra tarea com�n es dividir o combinar datos en diferentes columnas. En este ejemplo, 
#puede combinar el mes y el a�o de llegada en una columna usando la funci�n unite ():

  ```{r}
example_df <- bookings_df %>%
  select(arrival_date_year, arrival_date_month) %>% 
  unite(arrival_month_year, c("arrival_date_month", "arrival_date_year"), sep = " ")
```

## Step 5: Another way of doing things

#Tambi�n puede usar la funci�n`mutate () `para realizar cambios en sus columnas. 
#Supongamos que desea crear una nueva columna que resuma todos los adultos, ni�os 
#y beb�s de una reserva para el n�mero total de personas. Modifique el fragmento de 
#c�digo a continuaci�n para crear esa nueva columna:  

    ```{r}
example_df <- bookings_df %>%
  mutate(guests = people)

head(example_df)
```

#Excelente. �Ahora es el momento de calcular algunas estad�sticas resumidas! 
#Calcule el n�mero total de reservas canceladas y el tiempo medio de espera para 
#la reserva; querr� comenzar su c�digo despu�s del s�mbolo%>%. Cree una columna 
#llamada 'n�mero_cancelado' para representar el n�mero total de reservas canceladas. 
#Luego, cree una columna llamada 'average_lead_time' para representar el tiempo de 
#entrega promedio. Use la funci�n `resume ()` para hacer esto en el fragmento de c�digo a continuaci�n:  

    ```{r}

example_df <- bookings_df %>% resume()
  
  
  head(example_df)
```


