
   function toggleContent(element) {
       // Get the next sibling element (the content row)
       var content = element.parentElement.parentElement.nextElementSibling;
       if (content.style.display === "none" || content.style.display === "") {
           content.style.display = "table-row";
           element.classList.add("active-title");
       } else {
           content.style.display = "none";
           element.classList.remove("active-title");
       }
   }