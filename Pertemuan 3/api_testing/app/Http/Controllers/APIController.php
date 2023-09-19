<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\api_data;

class APIController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = api_data::all();
        return $data;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $save = new api_data;
        $save->name = $request->name;
        $save->bank = $request->bank;
        $save->alamat = $request->alamat;
        $save->save();

        return "Berhasil Menyimpan Data";
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request)
    {
        $data = api_data::all()->where('id', $request->id)->first();
        return $data;
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request)
    {
        $data = api_data::all()->where('id', $request->id)->first();
        $data->name = $request->name;
        $data->bank = $request->bank;
        $data->alamat = $request->alamat;
        $data->save();

        return "Berhasil Mengubah Data";
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        $del = api_data::all()->where('id', $request->id)->first();
        $del->delete();

        return "Berhasil Menghapus Data";
    }
}
