import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class TestDate {
    public static void main(String[] args) {
        System.out.println("=== Test de Fecha Simulada ===");
        System.out.println();
        
        // Fecha actual del sistema
        System.out.println("📅 Fecha actual del sistema:");
        System.out.println("   System.currentTimeMillis(): " + System.currentTimeMillis());
        System.out.println("   new Date(): " + new Date());
        System.out.println();
        
        // Fecha usando LocalDateTime
        System.out.println("🕐 Fecha usando LocalDateTime:");
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        System.out.println("   LocalDateTime.now(): " + now.format(formatter));
        System.out.println();
        
        // Fecha usando System.getProperty
        System.out.println("⚙️  Propiedades del sistema:");
        System.out.println("   user.timezone: " + System.getProperty("user.timezone"));
        System.out.println("   java.util.prefs.timezone: " + System.getProperty("java.util.prefs.timezone"));
        System.out.println();
        
        // Mostrar argumentos si los hay
        if (args.length > 0) {
            System.out.println("📝 Argumentos recibidos:");
            for (int i = 0; i < args.length; i++) {
                System.out.println("   [" + i + "]: " + args[i]);
            }
        }
        
        System.out.println();
        System.out.println("✅ Test completado");
    }
}
