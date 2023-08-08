---
layout: post
title: CrowdLayer
category: [doc]
tags: [models,agg_deep,Crowdlayer]
permalink: /models/crowdlayer/
css:
  badge: true
  syntax: true
  custom: >-
    table { font-size: .95rem; margin-bottom: 1.5rem; }
    tr:nth-child(odd) { backgroud-color: #e3edf3; }
    th, td { padding: .5em; }
    .box { border: 1px solid #e3edf3; padding: 1rem; }
    .plaintext { color: mediumseagreen; }
excerpt: Models available in peerannot
featured: false
---

## Crowdlayer (Rodrigues et. al 2018)

Given the output $z_i=\mathcal{C}(x_i)$, CrowdLayer introduce worker specific noise as an added layer to the network such that

$$
\mathcal{L}(x_i) = \sum_{j} CE(h_i^{(j)}, y_i^{(j)})
$$
with
$$
h_i^{(j)} = \pi^{(j)}\sigma(z_i).
$$

The weights in the added layer act as the confusion matrices from the Dawid and Skene model.

## CLI example

```bash
peerannot aggregate-deep . -o my_output --answers ./answers.json -s crowdlayer --model resnet18 \
          --img-size=224 --pretrained --n-classes=K --n-epochs=100 --lr=0.001 \
          -m 50 -m 75 --scheduler=multistep --batch-size=228 --optimizer=adam \
          --num-workers=8 --data-augmentation --seed=1
```