<?php

use App\Http\Controllers\Admin\AdminLeads;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;


Route::middleware(['auth', 'verified'])->group(function () {
    
    Route::get('/admin', function () {
        return Inertia::render('Admin/Home');
    })->name('admin.home');

    Route::get('/admin/leads', [AdminLeads::class, 'index'])->name('admin.leads');
    Route::get('/admin/leads/{id}', [AdminLeads::class, 'view'])->name('admin.lead.view');
    Route::get('/admin/leads/{id}/converter', [AdminLeads::class, 'converter'])->name('admin.lead.view');
    Route::get('/admin/leads/{id}/descartar', [AdminLeads::class, 'descartar'])->name('admin.lead.view');

    Route::get('/admin/harvey', function () {
        return Inertia::render('Admin/Harvey');
    })->name('admin.harvey');

    Route::get('/admin/financeiro', function () {
        return Inertia::render('Admin/Financeiro');
    })->name('admin.harvey');

    Route::get('/admin/docs', function () {
        return Inertia::render('Admin/Documentos');
    })->name('admin.docs');

});