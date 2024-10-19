<?php

return [
    'email' => [
        'is_unique' => 'Ese correo electrónico ya está registrado con otro usuario'
    ],
    'password_confirmation' => [
        'required' => 'Por favor, repite la contraseña',
        'matches' => 'Por favor, vuela a colocar la contraseña de nuevo'
    ]
];