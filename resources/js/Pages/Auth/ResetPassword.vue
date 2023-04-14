<script>

    export default
    {
        data: () => ({
            visible: false,
        }),

    }

</script>

<script setup>

    import GuestLayout from '@/Layouts/GuestLayout.vue';
    import { Head, useForm } from '@inertiajs/vue3';
    import InputRules from '@/Shared/rules';

    const props = defineProps({
        email: String,
        token: String,
    });

    const rules = InputRules
    
    const form = useForm({
        token: props.token,
        email: props.email,
        password: '',
        password_confirmation: '',
    });

    const submit = () => {
        form.post(route('password.store'), {
            onFinish: () => form.reset('password', 'password_confirmation'),
        });
    };

</script>

<template>
    <GuestLayout>
        <Head title="Resetar Senha"  />

        <v-card 
            title="Resetar Senha" 
            subtitle="Ahhh muleke"
            class="w-50" 
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
                    id="email"
                    label="Email"
                    type="email"
                    prepend-inner-icon="mdi-email" 
                    v-model="form.email"
                    :rules="[rules.required, rules.email]"
                    required
                    autofocus
                    autocomplete="username"
                />



                <v-text-field 
                    :append-inner-icon="visible ? 'mdi-eye-off' : 'mdi-eye'"
                    prepend-inner-icon="mdi-lock-outline" 
                    :type="visible ? 'text' : 'password'" 
                    placeholder="Digite sua senha" 
                    label="Senha"
                    @click:append-inner="visible = !visible"
                    :rules="[rules.required]"
                    autocomplete="new-password"
                    v-model="form.password"></v-text-field>

                <v-text-field 
                    :append-inner-icon="visible ? 'mdi-eye-off' : 'mdi-eye'"
                    prepend-inner-icon="mdi-lock-outline" 
                    :type="visible ? 'text' : 'password'" 
                    placeholder="Digite a nova senha novamente" 
                    label="Confirmação da Senha"
                    @click:append-inner="visible = !visible"
                    :rules="[rules.required, rules.email]"
                    autocomplete="new-password"
                    v-model="form.password_confirmation"></v-text-field>



                <div class="flex items-center justify-end mt-4">
                    <v-btn
                        type="submit" 
                        color="primary"
                        :class="{ 'opacity-25': form.processing }" 
                        :disabled="form.processing"
                        >
                        Reset Password
                    </v-btn>
                </div>
            </form>
            
        </v-card>

    </GuestLayout>
</template>
