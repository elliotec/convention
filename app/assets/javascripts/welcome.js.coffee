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
  return