---
layout: default
title: scroll
pagination:
  enabled: false
css:
   custom: >-
      /* width */
      ::-webkit-scrollbar {
        width: 6px;
      }

      /* Track */
      ::-webkit-scrollbar-track {
        background: #f1f1f1;
      }

      /* Handle */
      ::-webkit-scrollbar-thumb {
        background: #888;
      }

      /* Handle on hover */
      ::-webkit-scrollbar-thumb:hover {
        background: #555;
      }

      * {
        scrollbar-width: thin;
      }
---

<!-- Home Jumbotron
    ================================================== -->
  <section class="intro full-width">
      <div class="wrapintro">
          <h1>Peerannot</h1>
          <h2 class="lead">Handling your crowsourced datasets</h2>
          <a class="btn" href="https://github.com/peerannot/peerannot/" rel="noopener noreferrer" target="_blank">View on GitHub <i class='fab fa-github'></i></a>
      </div>
  </section>

<!-- Featured
  ================================================== -->
  <section class="featured-posts">

    <div class="row listfeaturedtag">

      {% for post in site.posts %}

        {% if post.featured == true %}

            {% include blocks/featured-box.html %}

        {% endif %}

      {% endfor %}

    </div>

  </section>