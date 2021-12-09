let myEditor = document.querySelector('#editor')
        const imageHandler = (e) => {
          let input = $('<input type="file" accept="image/*">')
          input.click()
          $(input).change(function (e) {
            let formData = new FormData()
            let uploadFile = $(input)[0].files[0]

            formData.append('uploadFile', uploadFile)

            $.ajax({
              type: 'post',
              url: '/upload',
              processData: false,
              contentType: false,
              data: formData,
              dataType: 'json',

              success: (res) => {
                console.log('2)')
                console.log(res)
                const IMG_URL = '/display?fileName=' 
                		+ encodeURIComponent(res[0].uploadPath + '/' + res[0].uuid + '_' + res[0].fileName)

                let range = quill.getSelection()
                console.log(range)
                quill.insertEmbed(range, 'image', IMG_URL)
              },
              error: (xhr, status, er) => console.log(xhr),
            }) // ajax
          }) // click
        } //imageHandletr



const toolbarOptions = [
          [{ header: [1, 2, 3, 4, 5, 6, false] }],
          [{ list: 'ordered' }, { list: 'bullet' }],
          ['bold', 'italic', 'underline', 'strike'],
          [{ color: [] }, { background: [] }],
          [{ align: [] }],
          ['image'],
          ['clean'],
        ]

        let quill = new Quill('#editor', {
          theme: 'snow',
          modules: {
            toolbar: toolbarOptions,
            imageDrop: true,
			imageResize: {
				displaySize: true,
			},
          },
        })

let toolbar = quill.getModule('toolbar')
toolbar.addHandler('image', imageHandler)