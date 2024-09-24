attribute vec4 a_position;
attribute vec4 a_color;

uniform vec2 u_resolution;
uniform vec2 u_translation;
uniform vec2 u_rotation;
varying vec4 v_color;

void main(){
    vec2 rotatedPosition=vec2(
        a_position.x*u_rotation.y+a_position.y*u_rotation.x,
    a_position.y*u_rotation.y-a_position.x*u_rotation.x);
    
    vec2 position=rotatedPosition+u_translation;
    vec2 zeroToOne=position/u_resolution;
    vec2 zeroToTwo=zeroToOne*2.;
    vec2 clipSpace=zeroToTwo-1.;
    
    gl_Position=vec4(clipSpace*vec2(1,-1),0,1);
    v_color=gl_Position*.5+.5;
}