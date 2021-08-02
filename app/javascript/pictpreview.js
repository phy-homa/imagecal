document.addEventListener('DOMContentLoaded',function(){
  if ( document.getElementById("image_picture")){
    const ImagePreview = document.getElementById("picture-preview");
    
    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.width = 600;
      blobImage.height = 400;

      blobImage.setAttribute('src', blob);

      imageElement.appendChild(blobImage);
      ImagePreview.appendChild(imageElement);
    };

    document.getElementById("image_picture").addEventListener("change", function(e){
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