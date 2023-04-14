<script setup>
import GuestLayout from '@/Layouts/GuestLayout.vue';
import { Head, useForm } from '@inertiajs/vue3';
import InputRules from '@/Shared/rules';

defineProps({
    status: String,
    errors: Array,
});

const rules = InputRules

const form = useForm({
    email: '',
});

const submit = () => {
    form.post(route('password.email'), {
        onSuccess: function()
        {
            console.log("hey", this, form)
        }
    }).then(function()
    {
        console.log('hummmmmm')
    });
};
</script>

<template>
    <GuestLayout title="Esqueceu a senha?">

        <Head title="Esqueci minha senha" />

        
        <v-card 
            class="w-50" 
            title="Resetar senha"
            subtitle="Lorem ipsum"
            :loading="form.processing"
        >
            
        
            <form class="pa-4" @submit.prevent="submit">
                
                <v-alert 
                    color="success" 
                    icon="mdi-check-circle-outline" 
                    class="mb-5 font-weight-bold" 
                    v-if="status">
                    {{ status }}
                </v-alert>

                <v-alert 
                    class="mb-5"
                    icon="mdi-alert-circle"
                    color="error" 
                    v-if="form.errors.email">
                    {{ form.errors.email }}
                </v-alert>

                <div>
                    <v-text-field 
                        prepend-inner-icon="mdi-email" 
                        v-model="form.email" 
                        label="Email cadastrado" 
                        :rules="[rules.required, rules.email]"
                        required
                    />
                </div>
            
                <div class="d-flex justify-end">
                    <v-btn 
                        type="submit" 
                        color="primary"
                        :class="{ 'opacity-25': form.processing }" 
                        :disabled="form.processing"
                        prepend-icon="mdi-email"
                    >
                        Enviar link
                    </v-btn>
                </div>

            </form>

        </v-card>

    </GuestLayout>
</template>

