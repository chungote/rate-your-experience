<richui:accordionItem id="${prefix}newQuestion" caption="New Question ">
  <g:render template="/question/edit"
          model="['questionInstance':questionInstance,'prefix':prefix]"/>
</richui:accordionItem>