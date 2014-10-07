########### Header #############
$(document).ready ($) ->
  menu = $(".centered-navigation-menu")
  menuToggle = $(".centered-navigation-menu-button")
  $(menuToggle).on "click", (e) ->
    e.preventDefault()
    e.stopPropagation()
    menu.slideToggle ->
      menu.removeAttr "style"  if menu.is(":hidden")
      return
    return

  if document.documentElement.clientWidth < 900
    $("html").click ->
      $(".centered-navigation-menu").hide()
      return

    $ ->
      $(".centered-navigation-menu").on
        click: ->
          $(".centered-navigation-menu").hide()
          return
      , "a"
      return

  if document.documentElement.clientWidth > 900
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

######### FAQ Tabs ##########
$(document).ready ($) ->
  $(".js-vertical-tab-content").hide()
  $(".js-vertical-tab-content:first").show()

  # if in tab mode 
  $(".js-vertical-tab").click (event) ->
    event.preventDefault()
    $(".js-vertical-tab-content").hide()
    activeTab = $(this).attr("rel")
    $("#" + activeTab).show()
    $(".js-vertical-tab").removeClass "is-active"
    $(this).addClass "is-active"
    $(".js-vertical-tab-accordion-heading").removeClass "is-active"
    $(".js-vertical-tab-accordion-heading[rel^='" + activeTab + "']").addClass "is-active"
    return

  # accordion mode 
  $(".js-vertical-tab-accordion-heading").click (event) ->
    event.preventDefault()
    $(".js-vertical-tab-content").hide()
    accordion_activeTab = $(this).attr("rel")
    $("#" + accordion_activeTab).show()
    $(".js-vertical-tab-accordion-heading").removeClass "is-active"
    $(this).addClass "is-active"
    $(".js-vertical-tab").removeClass "is-active"
    $(".js-vertical-tab[rel^='" + accordion_activeTab + "']").addClass "is-active"
    return

##### Append hash to URL ######
$ ->
  currentHash = "#"
  $(document).scroll ->
    $('.anchor').each ->
      top = window.pageYOffset
      distance = top - $(this).offset().top
      hash = $(this).attr('href')
      if distance < 20 and distance > -20 and currentHash isnt hash
        location.replace(hash)
        currentHash = hash
      return
    return
  return
