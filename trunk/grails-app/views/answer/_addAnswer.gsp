<richui:accordionItem id="${prefix}newAnswer" caption="New Answer ">
  <g:render template="/answer/edit"
          model="['answerInstance':answerInstance,'prefix':prefix]"/>
</richui:accordionItem>
