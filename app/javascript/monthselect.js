document.addEventListener('DOMContentLoaded',function(){
  if ( document.getElementById("form-box")){
    const select1 = document.getElementById("select1");
    const select2 = document.getElementById("select2");
    const select3 = document.getElementById("select3");
    const select4 = document.getElementById("select4");
    const select5 = document.getElementById("select5");
    const select6 = document.getElementById("select6");
    const select7 = document.getElementById("select7");
    const select8 = document.getElementById("select8");
    const select9 = document.getElementById("select9");
    const select10 = document.getElementById("select10");
    const select11 = document.getElementById("select11");
    const select12 = document.getElementById("select12");

    const unselect1 = document.getElementById("unselect1");
    const unselect2 = document.getElementById("unselect2");

    select1.addEventListener('change',function(){
      const picture1Select = document.getElementById("picture1-select")
      picture1Select.innerHTML =`<p>picture1:　${select1.value-1}月</p>`;
    });

    select2.addEventListener('change',function(){
      const picture2Select = document.getElementById("picture2-select")
      picture2Select.innerHTML =`<p>picture2:　${select2.value-1}月</p>`;
    });
    select3.addEventListener('change',function(){
      const picture3Select = document.getElementById("picture3-select")
      picture3Select.innerHTML =`<p>picture3:　${select3.value-1}月</p>`;
    });

    select4.addEventListener('change',function(){
      const picture4Select = document.getElementById("picture4-select")
      picture4Select.innerHTML =`<p>picture4:　${select4.value-1}月</p>`;
    });

    select5.addEventListener('change',function(){
      const picture5Select = document.getElementById("picture5-select")
      picture5Select.innerHTML =`<p>picture5:　${select5.value-1}月</p>`;
    });

    select6.addEventListener('change',function(){
      const picture6Select = document.getElementById("picture6-select")
      picture6Select.innerHTML =`<p>picture6:　${select6.value-1}月</p>`;
    });
    select7.addEventListener('change',function(){
      const picture7Select = document.getElementById("picture7-select")
      picture7Select.innerHTML =`<p>picture7:　${select7.value-1}月</p>`;
    });

    select8.addEventListener('change',function(){
      const picture8Select = document.getElementById("picture8-select")
      picture8Select.innerHTML =`<p>picture8:　${select8.value-1}月</p>`;
    });

    select9.addEventListener('change',function(){
      const picture9Select = document.getElementById("picture9-select")
      picture9Select.innerHTML =`<p>picture9:　${select9.value-1}月</p>`;
    });

    select10.addEventListener('change',function(){
      const picture10Select = document.getElementById("picture10-select")
      picture10Select.innerHTML =`<p>picture10:　${select10.value-1}月</p>`;
    });

    select11.addEventListener('change',function(){
      const picture11Select = document.getElementById("picture11-select")
      picture11Select.innerHTML =`<p>picture11:　${select11.value-1}月</p>`;
    });

    select12.addEventListener('change',function(){
      const picture12Select = document.getElementById("picture12-select")
      picture12Select.innerHTML =`<p>picture12:　${select12.value-1}月</p>`;
    });
  }
});