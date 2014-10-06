########### Header #############
$(document).ready ($) ->
  menu = $(".centered-navigation-menu")
  menuToggle = $(".centered-navigation-menu-button")
  $(menuToggle).on "click", (e) ->
    e.preventDefault()
    menu.slideToggle ->
      menu.removeAttr "style"  if menu.is(":hidden")
      return
    return
  return

enquire.register "screen and (min-width:640px)",
  match: ->
    $ ->
      $("#header_nav").data "size", "big"
      $("#header_logo").data "size", "big"
      return

    $(window).scroll ->
      if $(document).scrollTop() > 0
        if $("#header_nav, #header_logo").data("size") is "big"
          $("#header_nav, #header_logo").data "size", "small"
          $("#header_nav").stop().animate
            height: "60px"
            , 250
          $("#header_logo").stop().animate
            height: "3em"
            , 250
      else
        if $("#header_nav, #header_logo").data("size") is "small"
          $("#header_nav, #header_logo").data "size", "big"
          $("#header_nav").stop().animate
            height: "180px"
            , 250
          $("#header_logo").stop().animate
            height: "9em"
            , 250
      return

########## Parallax Pictures ###########
$(document).ready ($) ->
  
  getWindowHeight = ->
    windowHeight
  windowHeight = $(window).innerHeight()
  
  $(window).on "resize", ->
    windowHeight = $(window).innerHeight()
    return

  duration = $(".sectionhead").height() + getWindowHeight()
  bgPosMovement = "0 " + (duration * 0.8) + "px"
  
  controller = new ScrollMagic(globalSceneOptions:
    triggerHook: "onEnter"
    duration: duration
  )
  
  new ScrollScene(
    offset: -95
    triggerElement: "#slcimg"
  ).setTween(TweenMax.to("#slcimg", 1,
    backgroundPosition: bgPosMovement
    ease: Linear.easeNone
  )).addTo(controller)

  new ScrollScene(
    offset: -120
    triggerElement: "#agendaimg"
  ).setTween(TweenMax.to("#agendaimg", 1,
    backgroundPosition: bgPosMovement
    ease: Linear.easeNone
  )).addTo(controller)

  new ScrollScene(
    offset: -120
    triggerElement: "#recognitionimg"
  ).setTween(TweenMax.to("#recognitionimg", 1,
    backgroundPosition: bgPosMovement
    ease: Linear.easeNone
  )).addTo(controller)

  new ScrollScene(
    offset: -120
    triggerElement: "#eventsimg"
  ).setTween(TweenMax.to("#eventsimg", 1,
    backgroundPosition: bgPosMovement
    ease: Linear.easeNone
  )).addTo(controller)
  return