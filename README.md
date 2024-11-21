Resale Flat Prices in Singapore

Dataset is based on date of registration for the resale transactions from Jan 2017 to Nov 2024. Dataset contains 11 variables, exploratory analysis and visualisation is being done by filtering out data for Year 2024 onwards.

Dataset link: https://beta.data.gov.sg/collections/189/datasets/d_8b84c4ee58e3cfc0ece0d773c8ca6abc/view

Modelling objectives: 

1) To predict the price of resale flats using Artificial Neural Network regression.

2) To understand what are factors that drive or determine housing prices.

Explained variance score was used to assess ANN regression prediction model, it yield = 0.64

Explained variance score is similar to R^2 score, regression score function. Best possible score = 1.0

Exploratory data analysis showed that Prices for HDB flats around Bt.Timah is the most expensive, followed by Bishan area.
HDB flats around Ang Mo Kio area are the cheapest in 2024, second cheapest is around Jurong East.

There is steep increase in housing prices from 2020 to 2024.

Random Forest regressor prediction model achieved the smallest Root Mean Squared Error = 42762.218

Top three predictors of housing prices: 'floor area(sqm)', 'lease commence date' and 'remaining lease years'.

