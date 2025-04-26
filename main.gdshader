shader_type canvas_item;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);

    // Переводим в оттенок серого для унылого эффекта
    float gray = dot(tex_color.rgb, vec3(0.3, 0.59, 0.11));

    // Смесь между оригиналом и серым (0.0 - оригинал, 1.0 - полностью серый)
    float desaturation = 0.6;
    vec3 desaturated_color = mix(tex_color.rgb, vec3(gray), desaturation);

    // Затемняем цвет
    float darkness = 0.7; // 0.0 - без затемнения, 1.0 - полное затемнение
    vec3 dark_color = desaturated_color * (1.0 - darkness);

    // Добавляем холодный оттенок (синеву)
    dark_color.b += 0.1;

    COLOR = vec4(dark_color, tex_color.a);
}
