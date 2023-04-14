<script setup>
import GuestLayout from '@/Layouts/GuestLayout.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';
import InputRules from '@/Shared/rules';

const rules = InputRules;

const form = useForm({
    name: '',
    email: '',
    password: '',
    password_confirmation: '',
    terms: false,
});

const submit = () => {
    form.post(route('register'), {
        onFinish: () => form.reset('password', 'password_confirmation'),
    });
};
</script>

<template>
    <GuestLayout title="Cadastro">

        <Head title="Reistre-se" />

        <v-card
            class="w-50"
            title="Registre-se"
            subtitle="e junte-se a nós"
            :loading="form.processing"
            >

            <form @submit.prevent="submit" class="pa-4">

                <v-alert 
                    v-for="error in form.errors" 
                    v-if="form.errors" 
                    color="error" 
                    icon="mdi-alert-circle" 
                    class="mb-4">
                    {{  error  }}
                </v-alert>

               
                    
                <v-text-field
                    id="name"
                    type="text"
                    placeholder="Digite seu nome"
                    prepend-inner-icon="mdi-account"
                    label="Nome"
                    class="mt-1 block w-full"
                    v-model="form.name"
                    :rules="[rules.required]"
                    required
                    autofocus
                    autocomplete="name"
                />

      
                <v-text-field
                    id="email"
                    type="email"
                    label="Email"
                    placeholder="Digite seu email"
                    prepend-inner-icon="mdi-email"
                    v-model="form.email"
                    :rules="[rules.required, rules.email]"
                    required
                    autocomplete="username"
                />

        
                
                <v-text-field
                    prepend-inner-icon="mdi-lock-outline" 
                    :append-inner-icon="visible ? 'mdi-eye-off' : 'mdi-eye'"
                    :type="visible ? 'text' : 'password'" 
                    placeholder="Digite sua senha" 
                    label="Senha"
                    @click:append-inner="visible = !visible"
                    v-model="form.password"
                    :rules="[rules.required, rules.password]"
                    required
                    autocomplete="new-password"
                />

                
                <v-text-field
                prepend-inner-icon="mdi-lock-outline" 
                    :append-inner-icon="visible ? 'mdi-eye-off' : 'mdi-eye'"
                    :type="visible ? 'text' : 'password'" 
                    placeholder="Digite a Senha Novamente" 
                    label="Confirmação"
                    @click:append-inner="visible = !visible"
                    v-model="form.password_confirmation"
                    :rules="[rules.required, rules.password]"
                    required
                    autocomplete="new-password"
                />




                <div class="flex items-center justify-space-between mt-4">
                    
                    <Link
                        :href="route('login')"
                        class="underline text-sm text-gray-600 dark:text-gray-400 hover:text-gray-900 dark:hover:text-gray-100 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 dark:focus:ring-offset-gray-800"
                    >
                        Already registered?
                    </Link>

                    <v-btn
                        type="submit" 
                        class="ml-4" 
                        color="primary"
                        :class="{ 'opacity-25': form.processing }" 
                        :disabled="form.processing">
                        Register
                    </v-btn>
                </div>
            </form>

        </v-card>
        
    </GuestLayout>
</template>
