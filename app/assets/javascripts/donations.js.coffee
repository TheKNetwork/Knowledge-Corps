# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  
  n = 12
  y_spacing = 26

  data = $('#donations').data('donation') 
  if data != undefined
    #note #donations because we called id=donations
    #data('donations') because we had data=>donatios
    #grabs the top 5 elements based on Donation amount

    #data = {"Toronto":545.21,"Vancouver":250,"Montreal":128,"New York":252,"Calgary":322,"St. Johns":202, "Kelowna":200, "Paris":30,"Berlin":234,"Tokyo":124,"Tehran":450,"Cairo":151}

    data_ref = {}
    cities  = []
    amounts = []

    for item in data       #Converts to a Percentage value of the max, to scale the bar segments
      if data.length == 1
        data_ref[item.city] = n + 1
        break
      data_ref[item.city] = parseInt((((( item.amount ) / ( data[0].amount )) * n))) + 1

    chart = d3.select("#chart_place").append("svg")
    .attr("class", "chart")
    .attr("width", "100%")
    .attr("height", y_spacing * _.values(data_ref).length)

    x = d3.scale.linear().domain([0, d3.max(_.values(data_ref))]).range(["0px","450px"])
    

    tweenFunc = (d, i) ->
      sec = d3.scale.linear().domain([0, 1]).range([0, d])

      return (t) -> x(sec(t))

    chart.selectAll("div").data(_.values(data_ref)).enter().append("rect")
    .attr("y", (d,i) -> i*y_spacing)
    .attr("height", 20) 
    .style("fill", "#88B8C5")
    .transition()
      .duration(1000)
      .attrTween("width", tweenFunc)

    chart.selectAll("line").data(x.ticks(n)).enter().append("line")
    .attr("x1", x)
    .attr("x2", x)
    .attr("y1", 0)
    .attr("y2", y_spacing * _.values(data_ref).length)
    .style("stroke", "#FFFFFF")
    .style("stroke-width", "1.5px")

    bef_positions = ["1st","2nd","3rd","4th","5th"]
    positions = []

  #Determine parameters for the Bar Graph and labels
    for i in _.range data.length
      positions.push bef_positions[i] 
      cities.push(data[i].city)    
      amounts.push(data[i].amount)

    d3.select("#position").selectAll("p").data(positions).enter().append("p").text((d) -> d )
    d3.select("#cities").selectAll("p").data( cities ).enter().append("p").text((d) -> d )
    d3.select("#amount").selectAll("p").data( amounts ).enter().append("p").text((d) -> '$ ' + d )

