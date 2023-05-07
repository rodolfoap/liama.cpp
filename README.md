# Liama.cpp

A docker container to run a CPU uncensored Vicuna model using https://github.com/ggerganov/llama.cpp. Evidently, it can be used with alternative models.

### Building

```
./build.bash
```

### Launching

If the model is not present, it will be downloaded. Since the `./models` directory is mounted, it should be downloaded just once.

```
./launch.bash
```

### Defaults

In order to select or change the model, just modify the `entrypoint.bash` file.

By default, the `TheBloke/vicuna-AlekseyKorshuk-7B-GPTQ-4bit-128g-GGML` model is configured in the `entrypoint.bash` file. This is an excerpt:

```
> According to data and statistics, not to subjective opinions, which are the most corrupt politicians, democrats or republicans?

It is difficult to determine which party has the most corrupt politicians because political corruption is a complex issue that can occur in both parties. Both parties have had politicians who have been involved in corruption scandals.

In recent years, the Republican Party has been associated with several high-profile corruption scandals, including the Jack Abramoff scandal, in which several Republican members of Congress were involved in corruption. In the Democratic Party, there have been several cases of corruption, including the conviction of former Democratic Governor of Illinois, Rod Blagojevich, who was arrested on charges of corruption in 2009.

...
```
