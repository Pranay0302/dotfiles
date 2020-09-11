###
If you have multiple cores, the percentage number might exceed 100%
That's because the percentage is represented over just 1 core
so if you have 8 cores it can get up to 800%
###


command: "ps aux  | awk 'BEGIN { sum = 0 }  { sum += $3 }; END { print sum }' && sysctl hw.ncpu | awk '{print $2}'"

refreshFrequency: 2000

style: """
  bottom: 120px
  left: 10px
  color: #fff
  font-family: Monospace
  width:370px
  

  table
    border-collapse: collapse
    table-layout: fixed
    width:100%
  
    &:after
      content: 'CPU'
      position: absolute
      left: 50%
      top: -35px
      font-size: 20px
      padding:5px
  
  tr
    width: 100%

  td
    border: 1px solid #190000
    font-size: 24px
    font-weight: 100
    width: 100%
    height: 48px
    overflow: hidden
    text-shadow: 0 0 1px rgba(#000, 0.5)
  
  .wrapper
    padding: 4px 6px 4px 6px
    position: relative
    background: rgba(#ef6968, 0.4)
    height:100%

  .label
    position: absolute
    top: 1px
    left: 5px
    font-size: 15px
    font-weight: normal

"""

render: -> """
  <table>
    <tr>
      <td id="bar">
      </td>
    </tr>
  </table>
"""

update: (output, domEl) ->
  table = $(domEl).find('table')
  args = output.split('\n')

  render = (cpu,nCores) ->
    '<div class="wrapper" style="width:'+parseInt(cpu/nCores)+'%;"></div><div class="label">'+cpu+'%</div>'

  table.find("#bar").html render(args...)
