//Register
function form_validation(){
    var username = document.getElementById('username').value;
    var nama = document.getElementById('nama').value;

    var nik = document.getElementById('nik').value;

    var telp = document.getElementById('telp').value;

    var password1 = document.getElementById('password1').value;
    var password2 = document.getElementById('password2').value;

    if (username.value == ""|username.value == null){
        alert("Username Tidak Boleh Kosong !!!")
        return false;
    }else if(username.value.lenght <=3){
        alert("Username Terlalu Pendek !!!")
        return false;
    }

    if (nama.value == ""|nama.value == null){
        alert("Nama Tidak Boleh Kosong !!!")
        return false;
    }else if (nama.value.lenght <= 3){
        nama.setCustomValidity('Nama Terlalu Pendek');
        return false;
    }
    
    if (nik.value.match(niknum)){
        return true;
    }else if (isNaN(nik)|nik == null){
        nik.setCustomValidity('Harus Diisi Menggunakan Angka');
    }

    if (password2 == password1){
        return true;
    }else{
        password2.setCustomValidity('Password Tidak Sama');
    }

}