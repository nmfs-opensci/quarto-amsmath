function Header(el)
  -- The header level can be accessed via the attribute 'level'
  -- of the element. See the Pandoc documentation later.
  quarto.log.output(pandoc.utils.stringify(el.level))
  return el
end

function Meta(meta)
  if meta.title then
    quarto.log.output("Title: " .. pandoc.utils.stringify(meta.title))
  end
end

function Span(a)
  if a.classes[1] ~= "chapter-number" then return end
  chapnum = '<script>MathJax.config.section=' .. pandoc.utils.stringify(a.content[1]) .. '</script>'
  a.content = pandoc.RawInline('html', chapnum .. pandoc.utils.stringify(a.content[1]))
  return a
end

  
