// Compiled shader for PC, Mac & Linux Standalone

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Skybox/Procedural" {
Properties {
[KeywordEnum(None, Simple, High Quality)]  _SunDisk ("Sun", Float) = 2.000000
 _SunSize ("Sun Size", Range(0.000000,1.000000)) = 0.040000
 _SunSizeConvergence ("Sun Size Convergence", Range(1.000000,10.000000)) = 5.000000
 _AtmosphereThickness ("Atmosphere Thickness", Range(0.000000,5.000000)) = 1.000000
 _SkyTint ("Sky Tint", Color) = (0.500000,0.500000,0.500000,1.000000)
 _GroundColor ("Ground", Color) = (0.369000,0.349000,0.341000,1.000000)
 _Exposure ("Exposure", Range(0.000000,8.000000)) = 1.300000
}
SubShader { 
 Tags { "QUEUE"="Background" "RenderType"="Background" "PreviewType"="Skybox" }
 Pass {
  Tags { "QUEUE"="Background" "RenderType"="Background" "PreviewType"="Skybox" }
  ZWrite Off
  Cull Off
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: _SUNDISK_NONE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"

Constant Buffer "VGlobals" (196 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_MatrixVP at 80
  Vector4 _WorldSpaceLightPos0 at 0
  Float _Exposure at 144
  Vector3 _GroundColor at 160
  Vector3 _SkyTint at 176
  Float _AtmosphereThickness at 192
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float _Exposure;
    float3 _GroundColor;
    float3 _SkyTint;
    float _AtmosphereThickness;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float u_xlat7;
    float3 u_xlat9;
    float u_xlat14;
    float2 u_xlat16;
    float u_xlat21;
    float u_xlat22;
    float u_xlat23;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlat1.xyz = (-VGlobals._SkyTint.xyzx.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(0.300000012, 0.300000042, 0.300000012), float3(0.5, 0.419999987, 0.324999988));
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = float3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat21 = log2(VGlobals._AtmosphereThickness);
    u_xlat21 = u_xlat21 * 2.5;
    u_xlat21 = exp2(u_xlat21);
    u_xlat2.xy = float2(u_xlat21) * float2(0.049999997, 0.0314159282);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat3.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlatb0 = u_xlat3.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = fma(u_xlat3.y, u_xlat3.y, 0.0506249666);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = fma((-u_xlat0.y), u_xlat21, u_xlat0.x);
        u_xlat7 = fma((-u_xlat3.y), 1.0, 1.0);
        u_xlat14 = fma(u_xlat7, 5.25, -6.80000019);
        u_xlat14 = fma(u_xlat7, u_xlat14, 3.82999992);
        u_xlat14 = fma(u_xlat7, u_xlat14, 0.458999991);
        u_xlat7 = fma(u_xlat7, u_xlat14, -0.00286999997);
        u_xlat7 = u_xlat7 * 1.44269502;
        u_xlat0.y = exp2(u_xlat7);
        u_xlat0.xyz = u_xlat0.xyx * float3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat3.xyz;
        u_xlat4.xyz = fma(u_xlat4.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat22 = (-u_xlat21) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat21;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat21 = u_xlat23 / u_xlat21;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = fma(u_xlat16.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 0.458999991);
        u_xlat16.x = fma(u_xlat16.x, u_xlat23, -0.00286999997);
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat23 = fma(u_xlat21, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat21, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat21, u_xlat23, 0.458999991);
        u_xlat21 = fma(u_xlat21, u_xlat23, -0.00286999997);
        u_xlat21 = u_xlat21 * 1.44269502;
        u_xlat21 = exp2(u_xlat21);
        u_xlat21 = u_xlat21 * 0.25;
        u_xlat21 = fma(u_xlat16.x, 0.25, (-u_xlat21));
        u_xlat21 = fma(u_xlat22, u_xlat21, u_xlat0.y);
        u_xlat21 = max(u_xlat21, 0.0);
        u_xlat21 = min(u_xlat21, 50.0);
        u_xlat5.xyz = fma(u_xlat1.xyz, u_xlat2.yyy, float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat6.xyz = (-float3(u_xlat21)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat21 = u_xlat0.z * u_xlat22;
        u_xlat4.xyz = fma(u_xlat3.xyz, u_xlat0.xxx, u_xlat4.xyz);
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat22 = (-u_xlat0.x) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat0.x;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat23 / u_xlat0.x;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = fma(u_xlat16.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 0.458999991);
        u_xlat16.x = fma(u_xlat16.x, u_xlat23, -0.00286999997);
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat23 = fma(u_xlat0.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat0.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat0.x, u_xlat23, 0.458999991);
        u_xlat0.x = fma(u_xlat0.x, u_xlat23, -0.00286999997);
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = fma(u_xlat16.x, 0.25, (-u_xlat0.x));
        u_xlat0.x = fma(u_xlat22, u_xlat0.x, u_xlat0.y);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat22;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = fma(u_xlat6.xyz, float3(u_xlat21), u_xlat0.xyz);
        u_xlat4.xyz = u_xlat1.xyz * u_xlat2.xxx;
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * float3(0.0199999996, 0.0199999996, 0.0199999996);
    } else {
        u_xlat21 = min(u_xlat3.y, -0.00100000005);
        u_xlat21 = -9.99999975e-05 / u_xlat21;
        u_xlat5.xyz = fma(float3(u_xlat21), u_xlat3.xyz, float3(0.0, 1.00010002, 0.0));
        u_xlat22 = dot((-u_xlat3.xyz), u_xlat5.xyz);
        u_xlat16.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat22 = (-u_xlat22) + 1.0;
        u_xlat23 = fma(u_xlat22, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat22, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat22, u_xlat23, 0.458999991);
        u_xlat22 = fma(u_xlat22, u_xlat23, -0.00286999997);
        u_xlat22 = u_xlat22 * 1.44269502;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = fma(u_xlat16.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 0.458999991);
        u_xlat16.x = fma(u_xlat16.x, u_xlat23, -0.00286999997);
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat5.xy = float2(u_xlat22) * float2(0.25, 0.249900013);
        u_xlat22 = fma(u_xlat16.x, 0.25, u_xlat5.x);
        u_xlat16.xy = float2(u_xlat21) * float2(0.5, 20.0);
        u_xlat5.xzw = u_xlat16.xxx * u_xlat3.xyz;
        u_xlat5.xzw = fma(u_xlat5.xzw, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat21 = dot(u_xlat5.xzw, u_xlat5.xzw);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat21 = u_xlat21 * 230.831207;
        u_xlat21 = exp2(u_xlat21);
        u_xlat22 = fma(u_xlat21, u_xlat22, (-u_xlat5.y));
        u_xlat22 = max(u_xlat22, 0.0);
        u_xlat22 = min(u_xlat22, 50.0);
        u_xlat5.xyz = fma(u_xlat1.xyz, u_xlat2.yyy, float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat5.xyz = (-float3(u_xlat22)) * u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat21 = u_xlat16.y * u_xlat21;
        u_xlat9.xyz = float3(u_xlat21) * u_xlat0.xyz;
        u_xlat1.xyz = fma(u_xlat1.xyz, u_xlat2.xxx, float3(0.0199999996, 0.0199999996, 0.0199999996));
        u_xlat4.xyz = u_xlat1.xyz * u_xlat9.xyz;
    }
    output.TEXCOORD0 = u_xlat3.y * -50.0;
    u_xlat1.xyz = VGlobals._GroundColor.xxyz.yzw * VGlobals._GroundColor.xxyz.yzw;
    u_xlat0.xyz = fma(u_xlat1.xyz, u_xlat0.xyz, u_xlat4.xyz);
    output.TEXCOORD1.xyz = u_xlat0.xyz * float3(VGlobals._Exposure);
    u_xlat0.x = dot(VGlobals._WorldSpaceLightPos0.xyz, (-u_xlat3.xyz));
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = fma(u_xlat0.x, 0.75, 0.75);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    output.TEXCOORD2.xyz = u_xlat0.xyz * float3(VGlobals._Exposure);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Mtl_FragmentIn
{
    float TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    u_xlat0.x = input.TEXCOORD0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat1.xyz = input.TEXCOORD1.xyz + (-input.TEXCOORD2.xyz);
    u_xlat0.xyz = fma(u_xlat0.xxx, u_xlat1.xyz, input.TEXCOORD2.xyz);
    output.SV_Target0.xyz = sqrt(u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords set in this variant: _SUNDISK_NONE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Exposure;
uniform 	vec3 _GroundColor;
uniform 	vec3 _SkyTint;
uniform 	float _AtmosphereThickness;
in  vec4 in_POSITION0;
out float vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
vec3 u_xlat9;
float u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
float u_xlat23;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = (-_SkyTint.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.300000012, 0.300000042, 0.300000012) + vec3(0.5, 0.419999987, 0.324999988);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = vec3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat21 = log2(_AtmosphereThickness);
    u_xlat21 = u_xlat21 * 2.5;
    u_xlat21 = exp2(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * vec2(0.049999997, 0.0314159282);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlatb0 = u_xlat3.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = u_xlat3.y * u_xlat3.y + 0.0506249666;
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = (-u_xlat0.y) * u_xlat21 + u_xlat0.x;
        u_xlat7 = (-u_xlat3.y) * 1.0 + 1.0;
        u_xlat14 = u_xlat7 * 5.25 + -6.80000019;
        u_xlat14 = u_xlat7 * u_xlat14 + 3.82999992;
        u_xlat14 = u_xlat7 * u_xlat14 + 0.458999991;
        u_xlat7 = u_xlat7 * u_xlat14 + -0.00286999997;
        u_xlat7 = u_xlat7 * 1.44269502;
        u_xlat0.y = exp2(u_xlat7);
        u_xlat0.xyz = u_xlat0.xyx * vec3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat3.xyz;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat22 = (-u_xlat21) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat21;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat21 = u_xlat23 / u_xlat21;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat23 = u_xlat21 * 5.25 + -6.80000019;
        u_xlat23 = u_xlat21 * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat21 * u_xlat23 + 0.458999991;
        u_xlat21 = u_xlat21 * u_xlat23 + -0.00286999997;
        u_xlat21 = u_xlat21 * 1.44269502;
        u_xlat21 = exp2(u_xlat21);
        u_xlat21 = u_xlat21 * 0.25;
        u_xlat21 = u_xlat16.x * 0.25 + (-u_xlat21);
        u_xlat21 = u_xlat22 * u_xlat21 + u_xlat0.y;
        u_xlat21 = max(u_xlat21, 0.0);
        u_xlat21 = min(u_xlat21, 50.0);
        u_xlat5.xyz = u_xlat1.xyz * u_xlat2.yyy + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat6.xyz = (-vec3(u_xlat21)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat21 = u_xlat0.z * u_xlat22;
        u_xlat4.xyz = u_xlat3.xyz * u_xlat0.xxx + u_xlat4.xyz;
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat22 = (-u_xlat0.x) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat0.x;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat23 / u_xlat0.x;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat23 = u_xlat0.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat0.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat0.x * u_xlat23 + 0.458999991;
        u_xlat0.x = u_xlat0.x * u_xlat23 + -0.00286999997;
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = u_xlat16.x * 0.25 + (-u_xlat0.x);
        u_xlat0.x = u_xlat22 * u_xlat0.x + u_xlat0.y;
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat22;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat21) + u_xlat0.xyz;
        u_xlat4.xyz = u_xlat1.xyz * u_xlat2.xxx;
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * vec3(0.0199999996, 0.0199999996, 0.0199999996);
    } else {
        u_xlat21 = min(u_xlat3.y, -0.00100000005);
        u_xlat21 = -9.99999975e-05 / u_xlat21;
        u_xlat5.xyz = vec3(u_xlat21) * u_xlat3.xyz + vec3(0.0, 1.00010002, 0.0);
        u_xlat22 = dot((-u_xlat3.xyz), u_xlat5.xyz);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat22 = (-u_xlat22) + 1.0;
        u_xlat23 = u_xlat22 * 5.25 + -6.80000019;
        u_xlat23 = u_xlat22 * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat22 * u_xlat23 + 0.458999991;
        u_xlat22 = u_xlat22 * u_xlat23 + -0.00286999997;
        u_xlat22 = u_xlat22 * 1.44269502;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat5.xy = vec2(u_xlat22) * vec2(0.25, 0.249900013);
        u_xlat22 = u_xlat16.x * 0.25 + u_xlat5.x;
        u_xlat16.xy = vec2(u_xlat21) * vec2(0.5, 20.0);
        u_xlat5.xzw = u_xlat16.xxx * u_xlat3.xyz;
        u_xlat5.xzw = u_xlat5.xzw * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat21 = dot(u_xlat5.xzw, u_xlat5.xzw);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat21 = u_xlat21 * 230.831207;
        u_xlat21 = exp2(u_xlat21);
        u_xlat22 = u_xlat21 * u_xlat22 + (-u_xlat5.y);
        u_xlat22 = max(u_xlat22, 0.0);
        u_xlat22 = min(u_xlat22, 50.0);
        u_xlat5.xyz = u_xlat1.xyz * u_xlat2.yyy + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat5.xyz = (-vec3(u_xlat22)) * u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat21 = u_xlat16.y * u_xlat21;
        u_xlat9.xyz = vec3(u_xlat21) * u_xlat0.xyz;
        u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx + vec3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat4.xyz = u_xlat1.xyz * u_xlat9.xyz;
    //ENDIF
    }
    vs_TEXCOORD0 = u_xlat3.y * -50.0;
    u_xlat1.xyz = vec3(_GroundColor.x, _GroundColor.y, _GroundColor.z) * vec3(_GroundColor.x, _GroundColor.y, _GroundColor.z);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat4.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz * vec3(_Exposure);
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, (-u_xlat3.xyz));
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.75 + 0.75;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(_Exposure);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

in  float vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
void main()
{
    u_xlat0.x = vs_TEXCOORD0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.xyz = vs_TEXCOORD1.xyz + (-vs_TEXCOORD2.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    SV_Target0.xyz = sqrt(u_xlat0.xyz);
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: _SUNDISK_SIMPLE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"

Constant Buffer "VGlobals" (212 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_MatrixVP at 80
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 _LightColor0 at 144
  Float _Exposure at 160
  Vector3 _GroundColor at 176
  Vector3 _SkyTint at 192
  Float _AtmosphereThickness at 208
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _LightColor0;
    float _Exposure;
    float3 _GroundColor;
    float3 _SkyTint;
    float _AtmosphereThickness;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float3 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float3 TEXCOORD3 [[ user(TEXCOORD3) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float u_xlat7;
    float3 u_xlat9;
    float u_xlat14;
    float2 u_xlat16;
    float u_xlat21;
    float u_xlat22;
    float u_xlat23;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlat1.xyz = (-VGlobals._SkyTint.xyzx.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(0.300000012, 0.300000042, 0.300000012), float3(0.5, 0.419999987, 0.324999988));
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = float3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat21 = log2(VGlobals._AtmosphereThickness);
    u_xlat21 = u_xlat21 * 2.5;
    u_xlat21 = exp2(u_xlat21);
    u_xlat2.xy = float2(u_xlat21) * float2(0.049999997, 0.0314159282);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat3.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlatb0 = u_xlat3.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = fma(u_xlat3.y, u_xlat3.y, 0.0506249666);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = fma((-u_xlat0.y), u_xlat21, u_xlat0.x);
        u_xlat7 = fma((-u_xlat3.y), 1.0, 1.0);
        u_xlat14 = fma(u_xlat7, 5.25, -6.80000019);
        u_xlat14 = fma(u_xlat7, u_xlat14, 3.82999992);
        u_xlat14 = fma(u_xlat7, u_xlat14, 0.458999991);
        u_xlat7 = fma(u_xlat7, u_xlat14, -0.00286999997);
        u_xlat7 = u_xlat7 * 1.44269502;
        u_xlat0.y = exp2(u_xlat7);
        u_xlat0.xyz = u_xlat0.xyx * float3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat3.xyz;
        u_xlat4.xyz = fma(u_xlat4.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat22 = (-u_xlat21) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat21;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat21 = u_xlat23 / u_xlat21;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = fma(u_xlat16.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 0.458999991);
        u_xlat16.x = fma(u_xlat16.x, u_xlat23, -0.00286999997);
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat23 = fma(u_xlat21, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat21, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat21, u_xlat23, 0.458999991);
        u_xlat21 = fma(u_xlat21, u_xlat23, -0.00286999997);
        u_xlat21 = u_xlat21 * 1.44269502;
        u_xlat21 = exp2(u_xlat21);
        u_xlat21 = u_xlat21 * 0.25;
        u_xlat21 = fma(u_xlat16.x, 0.25, (-u_xlat21));
        u_xlat21 = fma(u_xlat22, u_xlat21, u_xlat0.y);
        u_xlat21 = max(u_xlat21, 0.0);
        u_xlat21 = min(u_xlat21, 50.0);
        u_xlat5.xyz = fma(u_xlat1.xyz, u_xlat2.yyy, float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat6.xyz = (-float3(u_xlat21)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat21 = u_xlat0.z * u_xlat22;
        u_xlat4.xyz = fma(u_xlat3.xyz, u_xlat0.xxx, u_xlat4.xyz);
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat22 = (-u_xlat0.x) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat0.x;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat23 / u_xlat0.x;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = fma(u_xlat16.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 0.458999991);
        u_xlat16.x = fma(u_xlat16.x, u_xlat23, -0.00286999997);
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat23 = fma(u_xlat0.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat0.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat0.x, u_xlat23, 0.458999991);
        u_xlat0.x = fma(u_xlat0.x, u_xlat23, -0.00286999997);
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = fma(u_xlat16.x, 0.25, (-u_xlat0.x));
        u_xlat0.x = fma(u_xlat22, u_xlat0.x, u_xlat0.y);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat22;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = fma(u_xlat6.xyz, float3(u_xlat21), u_xlat0.xyz);
        u_xlat4.xyz = u_xlat1.xyz * u_xlat2.xxx;
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * float3(0.0199999996, 0.0199999996, 0.0199999996);
    } else {
        u_xlat21 = min(u_xlat3.y, -0.00100000005);
        u_xlat21 = -9.99999975e-05 / u_xlat21;
        u_xlat5.xyz = fma(float3(u_xlat21), u_xlat3.xyz, float3(0.0, 1.00010002, 0.0));
        u_xlat22 = dot((-u_xlat3.xyz), u_xlat5.xyz);
        u_xlat16.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat22 = (-u_xlat22) + 1.0;
        u_xlat23 = fma(u_xlat22, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat22, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat22, u_xlat23, 0.458999991);
        u_xlat22 = fma(u_xlat22, u_xlat23, -0.00286999997);
        u_xlat22 = u_xlat22 * 1.44269502;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = fma(u_xlat16.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 0.458999991);
        u_xlat16.x = fma(u_xlat16.x, u_xlat23, -0.00286999997);
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat5.xy = float2(u_xlat22) * float2(0.25, 0.249900013);
        u_xlat22 = fma(u_xlat16.x, 0.25, u_xlat5.x);
        u_xlat16.xy = float2(u_xlat21) * float2(0.5, 20.0);
        u_xlat5.xzw = u_xlat16.xxx * u_xlat3.xyz;
        u_xlat5.xzw = fma(u_xlat5.xzw, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat21 = dot(u_xlat5.xzw, u_xlat5.xzw);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat21 = u_xlat21 * 230.831207;
        u_xlat21 = exp2(u_xlat21);
        u_xlat22 = fma(u_xlat21, u_xlat22, (-u_xlat5.y));
        u_xlat22 = max(u_xlat22, 0.0);
        u_xlat22 = min(u_xlat22, 50.0);
        u_xlat5.xyz = fma(u_xlat1.xyz, u_xlat2.yyy, float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat5.xyz = (-float3(u_xlat22)) * u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat21 = u_xlat16.y * u_xlat21;
        u_xlat9.xyz = float3(u_xlat21) * u_xlat0.xyz;
        u_xlat1.xyz = fma(u_xlat1.xyz, u_xlat2.xxx, float3(0.0199999996, 0.0199999996, 0.0199999996));
        u_xlat4.xyz = u_xlat1.xyz * u_xlat9.xyz;
    }
    u_xlat1.xyz = VGlobals._GroundColor.xxyz.yzw * VGlobals._GroundColor.xxyz.yzw;
    u_xlat1.xyz = fma(u_xlat1.xyz, u_xlat0.xyz, u_xlat4.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz * float3(VGlobals._Exposure);
    u_xlat21 = dot(VGlobals._WorldSpaceLightPos0.xyz, (-u_xlat3.xyz));
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = fma(u_xlat21, 0.75, 0.75);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat4.xyz;
    output.TEXCOORD2.xyz = u_xlat1.xyz * float3(VGlobals._Exposure);
    u_xlat21 = dot(VGlobals._LightColor0.xyz, VGlobals._LightColor0.xyz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = max(u_xlat21, 0.25);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * float3(8000.0, 8000.0, 8000.0);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0f, 1.0f);
    u_xlat0.xyz = u_xlat0.xyz * VGlobals._LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * float3(27.0, 27.0, 27.0);
    output.TEXCOORD3.xyz = u_xlat0.xyz / float3(u_xlat21);
    output.TEXCOORD0.xyz = (-u_xlat3.xyz);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Constant Buffer "FGlobals" (20 bytes) on slot 0 {
  Vector4 _WorldSpaceLightPos0 at 0
  Float _SunSize at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float _SunSize;
};

struct Mtl_FragmentIn
{
    float3 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float3 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    bool u_xlatb0;
    float3 u_xlat1;
    float3 u_xlat2;
    u_xlat0.xyz = input.TEXCOORD0.xyz + FGlobals._WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat2.x = float(1.0) / FGlobals._SunSize;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat2.x = fma(u_xlat0.x, -2.0, 3.0);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = fma((-u_xlat2.x), u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat2.x = input.TEXCOORD0.y * 50.0;
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat1.xyz = input.TEXCOORD1.xyz + (-input.TEXCOORD2.xyz);
    u_xlat2.xyz = fma(u_xlat2.xxx, u_xlat1.xyz, input.TEXCOORD2.xyz);
    u_xlat1.xyz = fma(input.TEXCOORD3.xyz, u_xlat0.xxx, u_xlat2.xyz);
    u_xlatb0 = input.TEXCOORD0.y<0.0;
    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : u_xlat2.xyz;
    output.SV_Target0.xyz = sqrt(u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords set in this variant: _SUNDISK_SIMPLE 
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _LightColor0;
uniform 	float _Exposure;
uniform 	vec3 _GroundColor;
uniform 	vec3 _SkyTint;
uniform 	float _AtmosphereThickness;
in  vec4 in_POSITION0;
out vec3 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
vec3 u_xlat9;
float u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
float u_xlat23;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = (-_SkyTint.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.300000012, 0.300000042, 0.300000012) + vec3(0.5, 0.419999987, 0.324999988);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = vec3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat21 = log2(_AtmosphereThickness);
    u_xlat21 = u_xlat21 * 2.5;
    u_xlat21 = exp2(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * vec2(0.049999997, 0.0314159282);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlatb0 = u_xlat3.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = u_xlat3.y * u_xlat3.y + 0.0506249666;
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = (-u_xlat0.y) * u_xlat21 + u_xlat0.x;
        u_xlat7 = (-u_xlat3.y) * 1.0 + 1.0;
        u_xlat14 = u_xlat7 * 5.25 + -6.80000019;
        u_xlat14 = u_xlat7 * u_xlat14 + 3.82999992;
        u_xlat14 = u_xlat7 * u_xlat14 + 0.458999991;
        u_xlat7 = u_xlat7 * u_xlat14 + -0.00286999997;
        u_xlat7 = u_xlat7 * 1.44269502;
        u_xlat0.y = exp2(u_xlat7);
        u_xlat0.xyz = u_xlat0.xyx * vec3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat3.xyz;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat22 = (-u_xlat21) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat21;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat21 = u_xlat23 / u_xlat21;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat23 = u_xlat21 * 5.25 + -6.80000019;
        u_xlat23 = u_xlat21 * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat21 * u_xlat23 + 0.458999991;
        u_xlat21 = u_xlat21 * u_xlat23 + -0.00286999997;
        u_xlat21 = u_xlat21 * 1.44269502;
        u_xlat21 = exp2(u_xlat21);
        u_xlat21 = u_xlat21 * 0.25;
        u_xlat21 = u_xlat16.x * 0.25 + (-u_xlat21);
        u_xlat21 = u_xlat22 * u_xlat21 + u_xlat0.y;
        u_xlat21 = max(u_xlat21, 0.0);
        u_xlat21 = min(u_xlat21, 50.0);
        u_xlat5.xyz = u_xlat1.xyz * u_xlat2.yyy + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat6.xyz = (-vec3(u_xlat21)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat21 = u_xlat0.z * u_xlat22;
        u_xlat4.xyz = u_xlat3.xyz * u_xlat0.xxx + u_xlat4.xyz;
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat22 = (-u_xlat0.x) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat0.x;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat23 / u_xlat0.x;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat23 = u_xlat0.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat0.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat0.x * u_xlat23 + 0.458999991;
        u_xlat0.x = u_xlat0.x * u_xlat23 + -0.00286999997;
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = u_xlat16.x * 0.25 + (-u_xlat0.x);
        u_xlat0.x = u_xlat22 * u_xlat0.x + u_xlat0.y;
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat22;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat21) + u_xlat0.xyz;
        u_xlat4.xyz = u_xlat1.xyz * u_xlat2.xxx;
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * vec3(0.0199999996, 0.0199999996, 0.0199999996);
    } else {
        u_xlat21 = min(u_xlat3.y, -0.00100000005);
        u_xlat21 = -9.99999975e-05 / u_xlat21;
        u_xlat5.xyz = vec3(u_xlat21) * u_xlat3.xyz + vec3(0.0, 1.00010002, 0.0);
        u_xlat22 = dot((-u_xlat3.xyz), u_xlat5.xyz);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat22 = (-u_xlat22) + 1.0;
        u_xlat23 = u_xlat22 * 5.25 + -6.80000019;
        u_xlat23 = u_xlat22 * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat22 * u_xlat23 + 0.458999991;
        u_xlat22 = u_xlat22 * u_xlat23 + -0.00286999997;
        u_xlat22 = u_xlat22 * 1.44269502;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat5.xy = vec2(u_xlat22) * vec2(0.25, 0.249900013);
        u_xlat22 = u_xlat16.x * 0.25 + u_xlat5.x;
        u_xlat16.xy = vec2(u_xlat21) * vec2(0.5, 20.0);
        u_xlat5.xzw = u_xlat16.xxx * u_xlat3.xyz;
        u_xlat5.xzw = u_xlat5.xzw * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat21 = dot(u_xlat5.xzw, u_xlat5.xzw);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat21 = u_xlat21 * 230.831207;
        u_xlat21 = exp2(u_xlat21);
        u_xlat22 = u_xlat21 * u_xlat22 + (-u_xlat5.y);
        u_xlat22 = max(u_xlat22, 0.0);
        u_xlat22 = min(u_xlat22, 50.0);
        u_xlat5.xyz = u_xlat1.xyz * u_xlat2.yyy + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat5.xyz = (-vec3(u_xlat22)) * u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat21 = u_xlat16.y * u_xlat21;
        u_xlat9.xyz = vec3(u_xlat21) * u_xlat0.xyz;
        u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx + vec3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat4.xyz = u_xlat1.xyz * u_xlat9.xyz;
    //ENDIF
    }
    u_xlat1.xyz = vec3(_GroundColor.x, _GroundColor.y, _GroundColor.z) * vec3(_GroundColor.x, _GroundColor.y, _GroundColor.z);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat4.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz * vec3(_Exposure);
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, (-u_xlat3.xyz));
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * 0.75 + 0.75;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(_Exposure);
    u_xlat21 = dot(_LightColor0.xyz, _LightColor0.xyz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = max(u_xlat21, 0.25);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(8000.0, 8000.0, 8000.0);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(27.0, 27.0, 27.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz / vec3(u_xlat21);
    vs_TEXCOORD0.xyz = (-u_xlat3.xyz);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	float _SunSize;
in  vec3 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD0.xyz + _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat2.x = float(1.0) / _SunSize;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat2.x) * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat2.x = vs_TEXCOORD0.y * 50.0;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.xyz = vs_TEXCOORD1.xyz + (-vs_TEXCOORD2.xyz);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlatb0 = vs_TEXCOORD0.y<0.0;
    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : u_xlat2.xyz;
    SV_Target0.xyz = sqrt(u_xlat0.xyz);
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: _SUNDISK_HIGH_QUALITY 
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"

Constant Buffer "VGlobals" (212 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_MatrixVP at 80
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 _LightColor0 at 144
  Float _Exposure at 160
  Vector3 _GroundColor at 176
  Vector3 _SkyTint at 192
  Float _AtmosphereThickness at 208
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _LightColor0;
    float _Exposure;
    float3 _GroundColor;
    float3 _SkyTint;
    float _AtmosphereThickness;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float3 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float3 TEXCOORD3 [[ user(TEXCOORD3) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float u_xlat7;
    float3 u_xlat9;
    float u_xlat14;
    float2 u_xlat16;
    float u_xlat21;
    float u_xlat22;
    float u_xlat23;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlat1.xyz = (-VGlobals._SkyTint.xyzx.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(0.300000012, 0.300000042, 0.300000012), float3(0.5, 0.419999987, 0.324999988));
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = float3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat21 = log2(VGlobals._AtmosphereThickness);
    u_xlat21 = u_xlat21 * 2.5;
    u_xlat21 = exp2(u_xlat21);
    u_xlat2.xy = float2(u_xlat21) * float2(0.049999997, 0.0314159282);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat3.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlatb0 = u_xlat3.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = fma(u_xlat3.y, u_xlat3.y, 0.0506249666);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = fma((-u_xlat0.y), u_xlat21, u_xlat0.x);
        u_xlat7 = fma((-u_xlat3.y), 1.0, 1.0);
        u_xlat14 = fma(u_xlat7, 5.25, -6.80000019);
        u_xlat14 = fma(u_xlat7, u_xlat14, 3.82999992);
        u_xlat14 = fma(u_xlat7, u_xlat14, 0.458999991);
        u_xlat7 = fma(u_xlat7, u_xlat14, -0.00286999997);
        u_xlat7 = u_xlat7 * 1.44269502;
        u_xlat0.y = exp2(u_xlat7);
        u_xlat0.xyz = u_xlat0.xyx * float3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat3.xyz;
        u_xlat4.xyz = fma(u_xlat4.xyz, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat22 = (-u_xlat21) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat21;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat21 = u_xlat23 / u_xlat21;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = fma(u_xlat16.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 0.458999991);
        u_xlat16.x = fma(u_xlat16.x, u_xlat23, -0.00286999997);
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat23 = fma(u_xlat21, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat21, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat21, u_xlat23, 0.458999991);
        u_xlat21 = fma(u_xlat21, u_xlat23, -0.00286999997);
        u_xlat21 = u_xlat21 * 1.44269502;
        u_xlat21 = exp2(u_xlat21);
        u_xlat21 = u_xlat21 * 0.25;
        u_xlat21 = fma(u_xlat16.x, 0.25, (-u_xlat21));
        u_xlat21 = fma(u_xlat22, u_xlat21, u_xlat0.y);
        u_xlat21 = max(u_xlat21, 0.0);
        u_xlat21 = min(u_xlat21, 50.0);
        u_xlat5.xyz = fma(u_xlat1.xyz, u_xlat2.yyy, float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat6.xyz = (-float3(u_xlat21)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat21 = u_xlat0.z * u_xlat22;
        u_xlat4.xyz = fma(u_xlat3.xyz, u_xlat0.xxx, u_xlat4.xyz);
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat22 = (-u_xlat0.x) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat0.x;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat23 / u_xlat0.x;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = fma(u_xlat16.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 0.458999991);
        u_xlat16.x = fma(u_xlat16.x, u_xlat23, -0.00286999997);
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat23 = fma(u_xlat0.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat0.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat0.x, u_xlat23, 0.458999991);
        u_xlat0.x = fma(u_xlat0.x, u_xlat23, -0.00286999997);
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = fma(u_xlat16.x, 0.25, (-u_xlat0.x));
        u_xlat0.x = fma(u_xlat22, u_xlat0.x, u_xlat0.y);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat22;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = fma(u_xlat6.xyz, float3(u_xlat21), u_xlat0.xyz);
        u_xlat4.xyz = u_xlat1.xyz * u_xlat2.xxx;
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * float3(0.0199999996, 0.0199999996, 0.0199999996);
    } else {
        u_xlat21 = min(u_xlat3.y, -0.00100000005);
        u_xlat21 = -9.99999975e-05 / u_xlat21;
        u_xlat5.xyz = fma(float3(u_xlat21), u_xlat3.xyz, float3(0.0, 1.00010002, 0.0));
        u_xlat22 = dot((-u_xlat3.xyz), u_xlat5.xyz);
        u_xlat16.x = dot(VGlobals._WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat22 = (-u_xlat22) + 1.0;
        u_xlat23 = fma(u_xlat22, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat22, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat22, u_xlat23, 0.458999991);
        u_xlat22 = fma(u_xlat22, u_xlat23, -0.00286999997);
        u_xlat22 = u_xlat22 * 1.44269502;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = fma(u_xlat16.x, 5.25, -6.80000019);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 3.82999992);
        u_xlat23 = fma(u_xlat16.x, u_xlat23, 0.458999991);
        u_xlat16.x = fma(u_xlat16.x, u_xlat23, -0.00286999997);
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat5.xy = float2(u_xlat22) * float2(0.25, 0.249900013);
        u_xlat22 = fma(u_xlat16.x, 0.25, u_xlat5.x);
        u_xlat16.xy = float2(u_xlat21) * float2(0.5, 20.0);
        u_xlat5.xzw = u_xlat16.xxx * u_xlat3.xyz;
        u_xlat5.xzw = fma(u_xlat5.xzw, float3(0.5, 0.5, 0.5), float3(0.0, 1.00010002, 0.0));
        u_xlat21 = dot(u_xlat5.xzw, u_xlat5.xzw);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat21 = u_xlat21 * 230.831207;
        u_xlat21 = exp2(u_xlat21);
        u_xlat22 = fma(u_xlat21, u_xlat22, (-u_xlat5.y));
        u_xlat22 = max(u_xlat22, 0.0);
        u_xlat22 = min(u_xlat22, 50.0);
        u_xlat5.xyz = fma(u_xlat1.xyz, u_xlat2.yyy, float3(0.0125663709, 0.0125663709, 0.0125663709));
        u_xlat5.xyz = (-float3(u_xlat22)) * u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz * float3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat21 = u_xlat16.y * u_xlat21;
        u_xlat9.xyz = float3(u_xlat21) * u_xlat0.xyz;
        u_xlat1.xyz = fma(u_xlat1.xyz, u_xlat2.xxx, float3(0.0199999996, 0.0199999996, 0.0199999996));
        u_xlat4.xyz = u_xlat1.xyz * u_xlat9.xyz;
    }
    output.TEXCOORD0.xyz = (-input.POSITION0.xyz);
    u_xlat1.xyz = VGlobals._GroundColor.xxyz.yzw * VGlobals._GroundColor.xxyz.yzw;
    u_xlat1.xyz = fma(u_xlat1.xyz, u_xlat0.xyz, u_xlat4.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz * float3(VGlobals._Exposure);
    u_xlat21 = dot(VGlobals._WorldSpaceLightPos0.xyz, (-u_xlat3.xyz));
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = fma(u_xlat21, 0.75, 0.75);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat4.xyz;
    output.TEXCOORD2.xyz = u_xlat1.xyz * float3(VGlobals._Exposure);
    u_xlat21 = dot(VGlobals._LightColor0.xyz, VGlobals._LightColor0.xyz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = max(u_xlat21, 0.25);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat0.xyz = u_xlat0.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0f, 1.0f);
    u_xlat0.xyz = u_xlat0.xyz * VGlobals._LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * float3(15.0, 15.0, 15.0);
    output.TEXCOORD3.xyz = u_xlat0.xyz / float3(u_xlat21);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Constant Buffer "FGlobals" (88 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Vector4 _WorldSpaceLightPos0 at 0
  Float _SunSize at 80
  Float _SunSizeConvergence at 84
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct FGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float _SunSize;
    float _SunSizeConvergence;
};

struct Mtl_FragmentIn
{
    float3 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float3 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    bool u_xlatb4;
    float u_xlat6;
    u_xlat0.x = log2(FGlobals._SunSize);
    u_xlat0.x = u_xlat0.x * 0.649999976;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat2.xyz = input.TEXCOORD0.yyy * FGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.TEXCOORD0.xxx, u_xlat2.xyz);
    u_xlat2.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.TEXCOORD0.zzz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
    u_xlat2.x = dot(FGlobals._WorldSpaceLightPos0.xyz, (-u_xlat2.xyz));
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * FGlobals._SunSizeConvergence;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat6 = fma((-u_xlat2.x), 1.98000002, 1.98010004);
    u_xlat0.y = fma(u_xlat2.x, u_xlat2.x, 1.0);
    u_xlat0.xy = u_xlat0.xy * float2(10.0, 0.0100164423);
    u_xlat6 = log2(u_xlat6);
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.y / u_xlat0.x;
    u_xlat2.x = u_xlat2.y * 50.0;
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlatb4 = u_xlat2.y<0.0;
    u_xlat1.xyz = input.TEXCOORD1.xyz + (-input.TEXCOORD2.xyz);
    u_xlat1.xyz = fma(u_xlat2.xxx, u_xlat1.xyz, input.TEXCOORD2.xyz);
    u_xlat0.xyw = fma(input.TEXCOORD3.xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.xyz = (bool(u_xlatb4)) ? u_xlat0.xyw : u_xlat1.xyz;
    output.SV_Target0.xyz = sqrt(u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords set in this variant: _SUNDISK_HIGH_QUALITY 
-- Hardware tier variant: Tier 1
-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _LightColor0;
uniform 	float _Exposure;
uniform 	vec3 _GroundColor;
uniform 	vec3 _SkyTint;
uniform 	float _AtmosphereThickness;
in  vec4 in_POSITION0;
out vec3 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
vec3 u_xlat9;
float u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
float u_xlat23;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = (-_SkyTint.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.300000012, 0.300000042, 0.300000012) + vec3(0.5, 0.419999987, 0.324999988);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = vec3(1.0, 1.0, 1.0) / u_xlat1.xyz;
    u_xlat21 = log2(_AtmosphereThickness);
    u_xlat21 = u_xlat21 * 2.5;
    u_xlat21 = exp2(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * vec2(0.049999997, 0.0314159282);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlatb0 = u_xlat3.y>=0.0;
    if(u_xlatb0){
        u_xlat0.x = u_xlat3.y * u_xlat3.y + 0.0506249666;
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat0.x = (-u_xlat0.y) * u_xlat21 + u_xlat0.x;
        u_xlat7 = (-u_xlat3.y) * 1.0 + 1.0;
        u_xlat14 = u_xlat7 * 5.25 + -6.80000019;
        u_xlat14 = u_xlat7 * u_xlat14 + 3.82999992;
        u_xlat14 = u_xlat7 * u_xlat14 + 0.458999991;
        u_xlat7 = u_xlat7 * u_xlat14 + -0.00286999997;
        u_xlat7 = u_xlat7 * 1.44269502;
        u_xlat0.y = exp2(u_xlat7);
        u_xlat0.xyz = u_xlat0.xyx * vec3(0.5, 0.246031836, 20.0);
        u_xlat4.xyz = u_xlat0.xxx * u_xlat3.xyz;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat22 = (-u_xlat21) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat21;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat21 = u_xlat23 / u_xlat21;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat23 = u_xlat21 * 5.25 + -6.80000019;
        u_xlat23 = u_xlat21 * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat21 * u_xlat23 + 0.458999991;
        u_xlat21 = u_xlat21 * u_xlat23 + -0.00286999997;
        u_xlat21 = u_xlat21 * 1.44269502;
        u_xlat21 = exp2(u_xlat21);
        u_xlat21 = u_xlat21 * 0.25;
        u_xlat21 = u_xlat16.x * 0.25 + (-u_xlat21);
        u_xlat21 = u_xlat22 * u_xlat21 + u_xlat0.y;
        u_xlat21 = max(u_xlat21, 0.0);
        u_xlat21 = min(u_xlat21, 50.0);
        u_xlat5.xyz = u_xlat1.xyz * u_xlat2.yyy + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat6.xyz = (-vec3(u_xlat21)) * u_xlat5.xyz;
        u_xlat6.xyz = u_xlat6.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat6.xyz = exp2(u_xlat6.xyz);
        u_xlat21 = u_xlat0.z * u_xlat22;
        u_xlat4.xyz = u_xlat3.xyz * u_xlat0.xxx + u_xlat4.xyz;
        u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat0.x = sqrt(u_xlat0.x);
        u_xlat22 = (-u_xlat0.x) + 1.0;
        u_xlat22 = u_xlat22 * 230.831207;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat4.xyz);
        u_xlat16.x = u_xlat16.x / u_xlat0.x;
        u_xlat23 = dot(u_xlat3.xyz, u_xlat4.xyz);
        u_xlat0.x = u_xlat23 / u_xlat0.x;
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat23 = u_xlat0.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat0.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat0.x * u_xlat23 + 0.458999991;
        u_xlat0.x = u_xlat0.x * u_xlat23 + -0.00286999997;
        u_xlat0.x = u_xlat0.x * 1.44269502;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * 0.25;
        u_xlat0.x = u_xlat16.x * 0.25 + (-u_xlat0.x);
        u_xlat0.x = u_xlat22 * u_xlat0.x + u_xlat0.y;
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat0.x = min(u_xlat0.x, 50.0);
        u_xlat4.xyz = u_xlat5.xyz * (-u_xlat0.xxx);
        u_xlat4.xyz = u_xlat4.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat4.xyz = exp2(u_xlat4.xyz);
        u_xlat0.x = u_xlat0.z * u_xlat22;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat21) + u_xlat0.xyz;
        u_xlat4.xyz = u_xlat1.xyz * u_xlat2.xxx;
        u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
        u_xlat0.xyz = u_xlat0.xyz * vec3(0.0199999996, 0.0199999996, 0.0199999996);
    } else {
        u_xlat21 = min(u_xlat3.y, -0.00100000005);
        u_xlat21 = -9.99999975e-05 / u_xlat21;
        u_xlat5.xyz = vec3(u_xlat21) * u_xlat3.xyz + vec3(0.0, 1.00010002, 0.0);
        u_xlat22 = dot((-u_xlat3.xyz), u_xlat5.xyz);
        u_xlat16.x = dot(_WorldSpaceLightPos0.xyz, u_xlat5.xyz);
        u_xlat22 = (-u_xlat22) + 1.0;
        u_xlat23 = u_xlat22 * 5.25 + -6.80000019;
        u_xlat23 = u_xlat22 * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat22 * u_xlat23 + 0.458999991;
        u_xlat22 = u_xlat22 * u_xlat23 + -0.00286999997;
        u_xlat22 = u_xlat22 * 1.44269502;
        u_xlat22 = exp2(u_xlat22);
        u_xlat16.x = (-u_xlat16.x) + 1.0;
        u_xlat23 = u_xlat16.x * 5.25 + -6.80000019;
        u_xlat23 = u_xlat16.x * u_xlat23 + 3.82999992;
        u_xlat23 = u_xlat16.x * u_xlat23 + 0.458999991;
        u_xlat16.x = u_xlat16.x * u_xlat23 + -0.00286999997;
        u_xlat16.x = u_xlat16.x * 1.44269502;
        u_xlat16.x = exp2(u_xlat16.x);
        u_xlat5.xy = vec2(u_xlat22) * vec2(0.25, 0.249900013);
        u_xlat22 = u_xlat16.x * 0.25 + u_xlat5.x;
        u_xlat16.xy = vec2(u_xlat21) * vec2(0.5, 20.0);
        u_xlat5.xzw = u_xlat16.xxx * u_xlat3.xyz;
        u_xlat5.xzw = u_xlat5.xzw * vec3(0.5, 0.5, 0.5) + vec3(0.0, 1.00010002, 0.0);
        u_xlat21 = dot(u_xlat5.xzw, u_xlat5.xzw);
        u_xlat21 = sqrt(u_xlat21);
        u_xlat21 = (-u_xlat21) + 1.0;
        u_xlat21 = u_xlat21 * 230.831207;
        u_xlat21 = exp2(u_xlat21);
        u_xlat22 = u_xlat21 * u_xlat22 + (-u_xlat5.y);
        u_xlat22 = max(u_xlat22, 0.0);
        u_xlat22 = min(u_xlat22, 50.0);
        u_xlat5.xyz = u_xlat1.xyz * u_xlat2.yyy + vec3(0.0125663709, 0.0125663709, 0.0125663709);
        u_xlat5.xyz = (-vec3(u_xlat22)) * u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
        u_xlat0.xyz = exp2(u_xlat5.xyz);
        u_xlat21 = u_xlat16.y * u_xlat21;
        u_xlat9.xyz = vec3(u_xlat21) * u_xlat0.xyz;
        u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx + vec3(0.0199999996, 0.0199999996, 0.0199999996);
        u_xlat4.xyz = u_xlat1.xyz * u_xlat9.xyz;
    //ENDIF
    }
    vs_TEXCOORD0.xyz = (-in_POSITION0.xyz);
    u_xlat1.xyz = vec3(_GroundColor.x, _GroundColor.y, _GroundColor.z) * vec3(_GroundColor.x, _GroundColor.y, _GroundColor.z);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat4.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz * vec3(_Exposure);
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, (-u_xlat3.xyz));
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * 0.75 + 0.75;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(_Exposure);
    u_xlat21 = dot(_LightColor0.xyz, _LightColor0.xyz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = max(u_xlat21, 0.25);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat0.xyz = u_xlat0.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(15.0, 15.0, 15.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz / vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _SunSize;
uniform 	float _SunSizeConvergence;
in  vec3 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
bool u_xlatb4;
float u_xlat6;
void main()
{
    u_xlat0.x = log2(_SunSize);
    u_xlat0.x = u_xlat0.x * 0.649999976;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat2.xyz = vs_TEXCOORD0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * vs_TEXCOORD0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * vs_TEXCOORD0.zzz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
    u_xlat2.x = dot(_WorldSpaceLightPos0.xyz, (-u_xlat2.xyz));
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _SunSizeConvergence;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat6 = (-u_xlat2.x) * 1.98000002 + 1.98010004;
    u_xlat0.y = u_xlat2.x * u_xlat2.x + 1.0;
    u_xlat0.xy = u_xlat0.xy * vec2(10.0, 0.0100164423);
    u_xlat6 = log2(u_xlat6);
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.y / u_xlat0.x;
    u_xlat2.x = u_xlat2.y * 50.0;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlatb4 = u_xlat2.y<0.0;
    u_xlat1.xyz = vs_TEXCOORD1.xyz + (-vs_TEXCOORD2.xyz);
    u_xlat1.xyz = u_xlat2.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = (bool(u_xlatb4)) ? u_xlat0.xyw : u_xlat1.xyz;
    SV_Target0.xyz = sqrt(u_xlat0.xyz);
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Hardware tier variant: Tier 1
-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

 }
}
CustomEditor "SkyboxProceduralShaderGUI"
Fallback Off
}