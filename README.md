# Hubot Codinglove script

A little script to get meme from [the coding love](http://thecodinglove.com/) and [les joies du code](http://loesjoiesducode.tumblr.com), both the last and a random one.

[![Build Status](https://travis-ci.org/eunomie/hubot-codinglove.png)](https://travis-ci.org/eunomie/hubot-codinglove) [![NPM version](https://badge.fury.io/js/hubot-codinglove.png)](http://badge.fury.io/js/hubot-codinglove)

## Usage

Returns the comment and the gif in all cases.

### The coding love

* `robot [give me some] joy [asshole]`: return a random
* `robot [spread some] love`: return a random
* `robot last joy`: return the last one
* `robot last love`: return the last one

### Les joies du code [fr]

* `robot [donne moi de la] joie [bordel]`: return a random
* `robot {dernière|derniere} joie`: return the last one

## Dependencies

* [cheerio](https://github.com/MatthewMueller/cheerio)
* [he](https://github.com/mathiasbynens/he)

## Installation

Add the package `hubot-codinglove` as a dependency in your Hubot `package.json` file.

    "dependencies": {
      "hubot-codinglove": "0.2.6"
    }

Run the following command to make sure the module is installed.

    $ npm install hubot-codinglove

To enable the script, add the `hubot-codinglove` entry to the `external-scripts.json` file (you may need to create this file).

    ["hubot-codinglove"]
