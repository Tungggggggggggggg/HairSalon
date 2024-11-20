package nhomj.example.hairsalon.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
public class WebMvcConfig implements WebMvcConfigurer {
    @Bean
    public ViewResolver viewResolver() {
        final InternalResourceViewResolver bean = new InternalResourceViewResolver();
        bean.setViewClass(JstlView.class);
        bean.setPrefix("/WEB-INF/views/");
        bean.setSuffix(".jsp");
        return bean;
    }

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.viewResolver(viewResolver());
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/admin_style/**").addResourceLocations("classpath:/static/admin_style/", "file:src/main/webapp/resources/admin_style/");
        registry.addResourceHandler("/staff_style/**").addResourceLocations("classpath:/static/staff_style/", "file:src/main/webapp/resources/staff_style/");
        registry.addResourceHandler("/user_style/**").addResourceLocations("classpath:/static/user_style/", "file:src/main/webapp/resources/user_style/");
        registry.addResourceHandler("/images/**").addResourceLocations("classpath:/static/images/", "file:src/main/webapp/resources/images/");
    }
}

