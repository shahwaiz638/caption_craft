### Flutter Application code can be found in `application` branch

# Distillation

1) We assumes that the dataset (`/captions` and `/captions_dev`) is placed or symlinked in the `/data` folder.
if the dataset is not created then you can create the data set using the `create_dataset` notebook file but ensure that you have the dataset in the following order:
```
short caption: The timeless Dara Chair is a mid century modern design featuring rounded wedge arms......
long caption: perfectly scaled to suit any room or décor the timeless dara chair ...........

```

2) We have added a `formatted-captions-final.txt` file that contains the formatted captions, you can run the create_dataset file to split the train and test data and store them in `/captions` and `/captions_dev`

3) Run the `cleaning_and_tokenization.ipynb` file to clean the dataset and train the tokenizer

4) Run the `distill-ensemble-pretraining-baby-llama` notebook, make sure that you have logged-in to hugging face using  the llama 2-7b token.
```huggingface-cli login```




