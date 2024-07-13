export default function (name) {
  $('#togglePassword').on('click', function () {
    const type = $('#inputLoginPass').attr('type') === 'password' ? 'text' : 'password';
    $('#inputLoginPass').attr('type', type);
    this.classList.toggle('bi-eye');
  })
  $('#btnSubmitLoginform').on('click', function() {
    $.ajax({
      url: '/login',
      method: 'GET',
    })
  })
};
