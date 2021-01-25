library(dplyr)
library(ggplot2)
library(forcats)

data("pib_produccion")
colnames(pib_produccion)

# pib anual
pib_produccion %>%
  group_by(año) %>%
  summarise(
    pib = sum(hnl)
  ) %>%
  ggplot(aes(año, pib)) +
  geom_line()

pib_produccion %>%
  group_by(actividad_economica) %>%
  summarise(suma = sum(hnl))

# produccion anual de cada actividad economica

pib_produccion %>%
  group_by(año, actividad_economica) %>%
  summarise(produccion_anual = sum(hnl)) %>%
  arrange(desc(año))

pib_produccion %>%
  group_by(año, actividad_economica) %>%
  summarise(produccion_anual = sum(hnl)) %>%
  ggplot(aes(año, produccion_anual, group = actividad_economica)) +
  geom_line()

pib_produccion %>%
  group_by(año, actividad_economica) %>%
  summarise(produccion_anual = sum(hnl)) %>%
  ggplot(aes(año, produccion_anual, group = actividad_economica)) +
  geom_line() +
  facet_wrap(.~ actividad_economica)

pib_produccion %>%
  group_by(año, actividad_economica) %>%
  summarise(produccion_anual = sum(hnl)) %>%
  ggplot(aes(actividad_economica, produccion_anual, group = actividad_economica)) +
  geom_boxplot() +
  coord_flip()

pib_produccion %>%
  group_by(año, actividad_economica) %>%
  summarise(produccion_anual = sum(hnl)) %>%
  filter(año == 2020) %>%
  ggplot(aes(actividad_economica, produccion_anual)) +
  geom_bar(stat = "identity") +
  coord_flip()

pib_produccion %>%
  group_by(año, actividad_economica) %>%
  summarise(produccion_anual = sum(hnl)) %>%
  filter(año == 2020) %>%
  mutate(name = fct_reorder(actividad_economica, produccion_anual)) %>%
  ggplot(aes(name, produccion_anual)) +
  geom_bar(stat = "identity") +
  coord_flip()


pib_produccion %>%
  group_by(año, actividad_economica) %>%
  summarise(produccion_anual = sum(hnl)) %>%
  filter(año %in% c(2018:2020)) %>%
  ggplot(aes(año, produccion_anual, fill = actividad_economica)) +
  geom_bar(stat = "identity", position = "dodge")

pib_produccion %>%
  group_by(año, actividad_economica) %>%
  summarise(produccion_anual = sum(hnl)) %>%
  filter(año %in% c(2018:2020)) %>%
  mutate(name = fct_reorder(actividad_economica, produccion_anual)) %>%
  ggplot(aes(año, produccion_anual, fill = name), color = "white") +
  geom_bar(stat = "identity", position = "dodge")
