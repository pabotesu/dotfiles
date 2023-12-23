#!/usr/bin/env bash

pkill wofi || {
  wofi --style=${HOME}/.config/wofi/style.css
}
