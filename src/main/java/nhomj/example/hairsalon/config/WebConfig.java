package nhomj.example.hairsalon.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addFormatterForFieldType(LocalDate.class, new org.springframework.format.Formatter<LocalDate>() {
            @Override
            public LocalDate parse(String text, Locale locale) {
                if (text != null && text.matches("\\d{4}-\\d{2}-\\d{2}")) {
                    return LocalDate.parse(text);
                }
                return LocalDate.parse(text, DateTimeFormatter.ofPattern("dd/MM/yyyy", locale));
            }

            @Override
            public String print(LocalDate object, Locale locale) {
                return object.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
            }
        });

        registry.addFormatterForFieldType(LocalTime.class, new org.springframework.format.Formatter<LocalTime>() {
            @Override
            public LocalTime parse(String text, Locale locale) {
                return LocalTime.parse(text, DateTimeFormatter.ofPattern("HH:mm"));
            }

            @Override
            public String print(LocalTime object, Locale locale) {
                return object.format(DateTimeFormatter.ofPattern("HH:mm"));
            }
        });
    }
}
