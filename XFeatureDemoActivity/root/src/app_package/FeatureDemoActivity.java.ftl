package ${packageName};

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;

public class ${activityClass} extends ${superClass} {
    private TextView mTxtInfo;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});
        mTxtInfo = findViewById(R.id.text_info);
    }

    public void button01Click(View view) {
        showText("button01Click" );
    }

    public void button02Click(View view) {
        showText("button02Click");
    }

    public void button03Click(View view) {
        showText("button03Click");
    }

    public void ClearClick(View view) {
        mTxtInfo.setText("");
    }

    private void showText(String value){
        CharSequence oldString = mTxtInfo.getText();
        mTxtInfo.setText(oldString + "\n" + value);
    }
}
