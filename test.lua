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