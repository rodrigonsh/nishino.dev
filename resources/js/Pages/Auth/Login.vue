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
    import {Head, Link, useForm} from '@inertiajs/vue3';
    import InputRules from "@/Shared/rules"

    defineProps({
        canResetPassword: Boolean,
        status: String,
    });

    const rules = InputRules

    const form = useForm({
        email: '',
        password: '',
        remember: false,
    });

    const submit = () => {
        form.post(route('login'), {
        onFinish: () => form.reset('password'),
    });
};
</script>

<template>
    <GuestLayout title="Log in">

        <Head title="Log in" />

        <v-container class="bg-dialog w-100 d-flex justify-end">

        <v-card 
            class="w-50" 
            title="Bem vindo!" 
            subtitle="Lorem ipsum" 
            :loading="form.processing">

            
            <form @submit.prevent="submit" class="pa-4">
                
                <v-alert color="success" v-if="status" class="mb-5" icon="$success">
                    {{ status }}
                </v-alert>

                <v-alert color="error" v-if="form.errors.email" class="mb-5" icon="$error">
                    {{ form.errors.email }}
                </v-alert>

                <v-text-field 
                    prepend-inner-icon="mdi-account" 
                    v-model="form.email" 
                    label="Email" 
                    :rules="[rules.required, rules.email]"
                    required />
                
                <v-text-field 
                    :append-inner-icon="visible ? 'mdi-eye-off' : 'mdi-eye'"
                    :type="visible ? 'text' : 'password'" 
                    placeholder="Digite sua senha" 
                    label="Senha"
                    prepend-inner-icon="mdi-lock-outline" 
                    @click:append-inner="visible = !visible"
                    :rules="[rules.required, rules.password]"
                    v-model="form.password"></v-text-field>
                

                <v-row>

                    <v-col>

                        <v-checkbox 
                            name="remember" 
                            label="Lembre-se de mim" 
                            v-model:checked="form.remember"
                            density="compact" class="mb-0" 
                        />

                    </v-col>

                    <v-col class="d-flex justify-end">

                        <v-btn 
                            variant="flat" 
                            type="submit"
                            :disabled="form.processing"
                            prepend-icon="mdi-arrow-right-circle" 
                            color="primary">
                            Log in
                        </v-btn>

                    </v-col>

                </v-row>

                 
            </form>

            <v-card-footer class="w-100 d-flex pa-2 bg-grey-lighten-4">
                <Link v-if="canResetPassword" :href="route('password.request')">
                    <v-btn variant="plain">Esqueceu a senha?</v-btn>
                </Link>
            </v-card-footer>
            
        </v-card>

    </v-container>

    </GuestLayout>
</template>
