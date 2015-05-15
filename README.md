# lita-diceman

> <q>It's the way a person chooses to limit themself that determines their character.</q>
>
> &mdash; <cite>Luke Rhinehart, The Dice Man</cite>

`diceman` is a handler which you can give options and it decides for you what
to do.

## Installation

Add lita-diceman to your Lita instance's Gemfile:

``` ruby
gem "lita-diceman"
```

## Usage

### `!dice`
returns one of the answers that you specify, randomly. You can add as many answers as you want.

```
You: !dice answer one;answer two
Lita: the dice commands: answer two
```

### `?dice`
returns an answer to your question.

```
You: ?dice Who is the smartest? Answer one;Answer two
Lita: Answer one is the smartest
```
