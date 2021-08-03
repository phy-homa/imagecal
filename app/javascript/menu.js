window.addEventListener('load',function(){
  const pullDownButton = document.getElementById("menutab");
  const menuList = document.getElementById("menu-list")
  pullDownButton.addEventListener('click', function(){
    if (menuList.getAttribute("style") == "display:block;"){
      pullDownButton.style.opacity = 1;
      menuList.removeAttribute("style", "display:block;")
    }else{
      pullDownButton.style.opacity = 0.7;
      menuList.setAttribute("style", "display:block;")
    }
  })
})