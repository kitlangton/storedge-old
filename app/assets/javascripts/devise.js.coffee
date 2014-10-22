$ ->
  if $(".sign-in-page")[0]
    $(".sign-in-container *").addClass "fade-in-sign-in"
    $(".fade-in-sign-in").css "display", "none"
    $(".fade-in-sign-in").velocity "transition.slideUpIn",
      drag: true
      stagger: 25


