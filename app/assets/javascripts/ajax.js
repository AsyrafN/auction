// <script>
//   $(".alert").delay(1000).fadeOut('slow');

//   $(document).on('turbolinks:load', function(){
//     $("#products_search").keyup(function(){
//       console.log("products_search")
//       autocomplete()
//     });
//     function autocomplete(){
//       $.ajax({
//         url: '/products/ajax_search',
//         type: 'GET',
//         data: {query: $("#products_search").val()},
//   //takes the form data and authenticity toke and converts it into a standard URL
//         dataType: 'json', //specify what type of data you're expecting back from the servers
//         error: function() {
//             console.log("Something went wrong");
//         },
//         success: function(data) {
//           console.log(data)
//           document.querySelector('#list').innerHTML = ""
//           data.forEach(function(element) {
//             var option = document.createElement("option");
//             option.value = element;
//             //append option to list
//             $("#list").append(option);
//           });
//         }
//       });
//     }
//   });
// </script>