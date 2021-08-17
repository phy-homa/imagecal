document.addEventListener('DOMContentLoaded',function(){
  if ( document.getElementById("user-icon")){
    const IconPreview = document.getElementById("icon-preview");
    
    const createImageHTML = (blob) => {
      const iconElement = document.createElement('div');
      const blobIcon = document.createElement('img');
      blobIcon.width = 100;
      blobIcon.height = 100;
      
      blobIcon.setAttribute('src', blob);

      iconElement.appendChild(blobIcon);
      IconPreview.appendChild(iconElement);
      IconPreview.setAttribute("style","border: 1px solid darkgreen;");

    };

    document.getElementById("user-icon").addEventListener("change", function(e){
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  }
});