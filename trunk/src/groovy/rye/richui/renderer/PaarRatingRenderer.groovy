package rye.richui.renderer

/**
 * Created by IntelliJ IDEA.
 * User: jbrush
 * Date: Jun 10, 2010
 * Time: 2:20:56 PM
 * To change this template use File | Settings | File Templates.
 */

import de.andreasschmitt.richui.taglib.renderer.RatingRenderer
import de.andreasschmitt.richui.taglib.renderer.RenderException
import de.andreasschmitt.richui.taglib.renderer.RenderUtils
import groovy.xml.MarkupBuilder

class PaarRatingRenderer extends RatingRenderer {


  protected void renderTagContent(Map attrs, Closure body, MarkupBuilder builder) throws RenderException {
    String id = "r" + RenderUtils.getUniqueId()
    //Default 30px width stars
    if (!attrs?.imageWidth) {
      attrs.imageWidth = 30
    }
    else {
      attrs.imageWidth = Integer.parseInt(attrs.imageWidth)
    }
    int imageWidth = (attrs?.imageWidth) ?: 30
    int currentRating = attrs?.rating * imageWidth
    int units = attrs?.units * imageWidth
    String currentRatingId = "r" + RenderUtils.getUniqueId()

    String updateId = id
    if (attrs?.updateId) {
      updateId = attrs.updateId
    }

    if (!attrs?.inputId) {
      attrs.inputId = "r" + RenderUtils.getUniqueId()
    }
    if (!attrs?.inputName) {
      attrs.inputName = "rating"
    }

    builder.div(id: "${id}") {
      div("class": "ratingblock") {
        div(id: "unit_long$id") {
          if (attrs?.dynamic) {
            ul(id: "unit_ul$id", "class": "${attrs?.clazz ?: "unit-rating"}", style: "width: ${units}px") {
              li(id: "${currentRatingId}", "class": "current-rating", style: "width: ${currentRating}px;", "Currently $attrs.rating")
              for (i in 1..attrs.units) {
                li() {
                  if (attrs?.noAjax) {
                    a("class": "r${i}-unit rater", onclick: "window.document.getElementById(\"${attrs.inputId}\").value = ${i}; window.document.getElementById(\"${currentRatingId}\").style.width = \"${i * imageWidth}px\"; window.document.getElementById(\"${currentRatingId}\").innerHTML = \"Currently ${i}\";", "${i}")
                  }
                  else {
                    String link = attrs.link.replace(":class:", "r${i}-unit rater").replace(":title:", "$i").replace("update", "${updateId}").replace("number", "$i").replace("%3Arating%3A", "${i}")
                    builder.yieldUnescaped "$link"
                  }
                }
              }
            }
          }
          else {
            ul(id: "unit_ul$id", "class": "unit-rating", style: "width: ${units}px") {
              li("class": "current-rating", style: "width: ${currentRating}px;", "Currently $attrs.rating")
            }
          }

          if (attrs.showCurrent) {
            p("class": "static") {
              strong(attrs?.rating)
            }
          }
        }
      }

      if (attrs?.noAjax) {
        input(id: attrs.inputId, name: attrs.inputName, type: "hidden")
      }
    }
  }

}

