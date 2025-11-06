# HAYAT HEALTH SCORE FRAMEWORK V2.0
## Comprehensive Health Scoring System for Digital Twin Platform

**Version:** 2.0 (Blueprint-Optimized)  
**Date:** November 6, 2025  
**Purpose:** Define calculation methodology for overall Hayat Health Score and subsidiary pillar scores  
**Based on:** Bryan Johnson's Blueprint Protocol Emphasis Analysis

---

## 🎯 **DESIGN PHILOSOPHY**

### **Core Principles:**
1. **Actionable** - Users can see which pillar needs improvement
2. **Data-Driven** - Scores based on measurable biomarkers and behaviors
3. **Predictive** - Shows projected health in 12-18 months if recommendations followed
4. **Culturally Adapted** - UAE-specific norms and Emirati population data
5. **Evidence-Based** - Grounded in scientific research and clinical guidelines
6. **Blueprint-Optimized** - Weighting based on Bryan Johnson's proven healthspan protocol

### **Inspiration:**
- **Blueprint (Bryan Johnson):** 11 biomarkers, 3 Power Laws (Sleep #1, Exercise #2, Diet #3)
- **Empirical Health:** 6 subcategories with radar chart visualization
- **InsideTracker:** Healthspan categories with actionable recommendations
- **Wild Health:** Precision medicine scoring with genetic data

---

## 📊 **HAYAT HEALTH SCORE STRUCTURE (V2.0)**

### **Overall Score: Hayat Health Score (0-100)**

**One comprehensive score** composed of **6 subsidiary pillar scores**:

```
HAYAT HEALTH SCORE = Weighted average of 6 pillars

Formula (Blueprint-Optimized):
HHS = (S × 0.25) + (CV × 0.25) + (M × 0.20) + (Cog × 0.10) + (Ment × 0.10) + (Mic × 0.10)

Where:
- S = Sleep & Recovery Score (0-100)
- CV = Cardiovascular Health Score (0-100)
- M = Metabolic Health Score (0-100)
- Cog = Cognitive Health Score (0-100)
- Ment = Mental Health Score (0-100)
- Mic = Microbiome Health Score (0-100)
```

### **Weighting Rationale (Based on Blueprint Analysis):**

| Pillar | V1.0 Weight | **V2.0 Weight** | Change | Justification |
|--------|-------------|----------------|--------|---------------|
| **Sleep & Recovery** | 15% | **25%** | **+10%** | Bryan's #1 explicit priority (41.7% daily time), foundation for all other pillars |
| **Cardiovascular** | 25% | **25%** | 0% | #1 biomarker priority (36.4%), hsCRP "most important", #1 killer in UAE (40% deaths) |
| **Metabolic** | 20% | **20%** | 0% | #2 biomarker priority (27.3%), diabetes 20.7% UAE prevalence, includes diet |
| **Cognitive** | 15% | **10%** | -5% | Not explicitly tracked by Bryan (yet), implied through sleep/inflammation |
| **Mental Health** | 15% | **10%** | -5% | Not explicitly tracked by Bryan (yet), implied through HRV/stress management |
| **Microbiome** | 10% | **10%** | 0% | Not yet tracked by Bryan, but "coming soon", emerging priority |

### **Key Changes from V1.0:**

**✅ Sleep increased from 15% → 25%**
- Bryan's explicit "#1 life priority"
- 41.7% of daily time investment
- "If you get your sleep right, everything else becomes easier"
- Cascading effect on exercise and diet

**✅ Cognitive & Mental reduced from 15% → 10% each**
- Not explicitly tracked in Bryan's 11 biomarkers
- Implied through sleep quality, inflammation control, HRV
- Will increase weight when more data available

---

## 🏛️ **THE 6 HEALTH PILLARS (V2.0)**

---

### **PILLAR 1: SLEEP & RECOVERY SCORE (0-100) - 25% WEIGHT**

**What it measures:** Sleep quality, circadian rhythm, recovery, HRV during sleep

**Why #1 Priority:**
- Bryan Johnson: "Consistent, high quality sleep is your #1 life priority"
- Foundation for all other health pillars
- Affects metabolism, cognition, mood, immune function, cardiovascular health
- 41.7% of Bryan's daily time investment

#### **Data Sources (Hayat AI Multi-Modal):**

1. **Wearable Sleep Tracking** (50% of pillar)
   - Total sleep time (target: 8-9 hours)
   - Sleep efficiency (target: >85%)
   - Deep sleep duration (target: >20% of total)
   - REM sleep duration (target: >20% of total)
   - Sleep latency (time to fall asleep)
   - Wake-ups during night
   - Consistency (bedtime variance)

2. **Heart Rate Variability (HRV)** (25% of pillar)
   - HRV during sleep (parasympathetic activity)
   - Resting heart rate during sleep
   - Recovery score (Whoop-style)
   - Respiratory rate during sleep

3. **Sleep Quality Questionnaire** (15% of pillar)
   - Subjective sleep quality
   - Daytime alertness
   - Sleep disorders screening (apnea, insomnia)
   - Caffeine/stimulant use timing

4. **Circadian Rhythm Markers** (10% of pillar)
   - Bedtime consistency
   - Wake time consistency
   - Light exposure timing
   - Meal timing (last meal before bed)
   - Screen time before bed

#### **Calculation Methodology:**

```python
def calculate_sleep_score(data):
    # Wearable data (50%)
    sleep_duration_score = score_range(data['total_sleep'], 7.0, 9.0, optimal=8.5)
    sleep_efficiency_score = score_range(data['sleep_efficiency'], 0.75, 1.0, optimal=0.90)
    deep_sleep_score = score_range(data['deep_sleep_pct'], 15, 25, optimal=20)
    rem_sleep_score = score_range(data['rem_sleep_pct'], 18, 25, optimal=22)
    
    wearable_score = (
        sleep_duration_score * 0.3 +
        sleep_efficiency_score * 0.3 +
        deep_sleep_score * 0.2 +
        rem_sleep_score * 0.2
    )
    
    # HRV (25%)
    hrv_score = score_range(data['hrv_sleep'], 30, 100, optimal=70, age_adjusted=True)
    rhr_score = score_range(data['resting_hr'], 40, 70, optimal=55, reverse=True)
    recovery_score = data['recovery_score']  # 0-100 from wearable
    
    hrv_component = (
        hrv_score * 0.4 +
        rhr_score * 0.3 +
        recovery_score * 0.3
    )
    
    # Questionnaire (15%)
    quality_score = data['subjective_quality']  # 0-100
    alertness_score = data['daytime_alertness']  # 0-100
    disorder_penalty = data['sleep_disorder_risk'] * -20  # -20 if high risk
    
    questionnaire_score = (
        quality_score * 0.5 +
        alertness_score * 0.5 +
        disorder_penalty
    )
    
    # Circadian rhythm (10%)
    bedtime_consistency = score_variance(data['bedtime_variance'], max_variance=30)  # minutes
    wake_consistency = score_variance(data['wake_variance'], max_variance=30)
    meal_timing_score = score_hours_before_bed(data['last_meal_time'], optimal=4)
    
    circadian_score = (
        bedtime_consistency * 0.4 +
        wake_consistency * 0.4 +
        meal_timing_score * 0.2
    )
    
    # Final sleep score
    sleep_score = (
        wearable_score * 0.50 +
        hrv_component * 0.25 +
        questionnaire_score * 0.15 +
        circadian_score * 0.10
    )
    
    return max(0, min(100, sleep_score))
```

#### **Scoring Ranges:**

| Score Range | Rating | Description |
|------------|--------|-------------|
| 90-100 | Optimal | Professional sleeper level, Bryan Johnson-tier |
| 80-89 | Excellent | High-quality sleep, good recovery |
| 70-79 | Good | Adequate sleep, room for improvement |
| 60-69 | Fair | Suboptimal sleep, affecting health |
| 50-59 | Poor | Sleep issues need attention |
| 0-49 | Critical | Severe sleep problems, immediate intervention needed |

#### **Actionable Insights Examples:**

**Score 55/100 (Poor):**
- 🎯 **Top Priority:** Increase sleep duration from 6.2 to 8 hours (+23 points potential)
- 💡 **Quick Win:** Move bedtime from 11:30 PM to 10:00 PM (consistent with Bryan's 8:30 PM)
- 📊 **Impact:** Sleep efficiency will improve from 78% to 85%+ with consistent schedule

**Score 82/100 (Excellent):**
- 🎯 **Optimization:** Reduce sleep latency from 15 min to <5 min
- 💡 **Tip:** Add 60-min wind-down routine (Bryan's protocol)
- 📊 **Impact:** +5 points, reach 87/100

---

### **PILLAR 2: CARDIOVASCULAR HEALTH SCORE (0-100) - 25% WEIGHT**

**What it measures:** Heart health, vascular function, blood flow, inflammation, cardiac fitness

**Why #1 Biomarker Priority:**
- 36.4% of Bryan Johnson's tracked biomarkers
- hsCRP (inflammation) marked as "MOST IMPORTANT" biomarker
- #1 killer in UAE (40% of deaths)
- 70% increased mortality when LDL elevated

#### **Data Sources (Hayat AI Multi-Modal):**

1. **Blood Biomarkers** (40% of pillar)
   - **LDL-C** (low-density lipoprotein cholesterol) - Target: <70 mg/dL (Bryan: 45)
   - **LDL-P** (LDL particle number) - Target: <700 nmol/L (Bryan: 509)
   - **HDL-C** (high-density lipoprotein) - Target: >60 mg/dL (Bryan: 78)
   - **hsCRP** (high-sensitivity C-reactive protein) - Target: <1.0 mg/L (Bryan: <0.1) **[MOST IMPORTANT]**
   - **Omega-3 Index** - Target: >5.4% (Bryan: 9.98%)
   - Triglycerides - Target: <150 mg/dL
   - Total cholesterol - Target: <200 mg/dL
   - Apolipoprotein B - Target: <90 mg/dL
   - Homocysteine - Target: <10 µmol/L

2. **Retinal Imaging AI** (25% of pillar)
   - Retinal vessel analysis
   - Arterial narrowing detection
   - CVD risk prediction (5-10 years)
   - Hypertension indicators
   - Microvascular health

3. **Wearable Data** (20% of pillar)
   - Resting heart rate - Target: 40-60 bpm
   - Heart rate variability (HRV) - Target: >50 ms (age-adjusted)
   - VO2 max estimate - Target: >40 mL/kg/min (age-adjusted)
   - Cardio fitness level
   - Irregular rhythm notifications

4. **Clinical Measurements** (10% of pillar)
   - Blood pressure - Target: <120/80 mmHg
   - Pulse pressure - Target: <40 mmHg
   - BMI - Target: 18.5-24.9
   - Waist circumference - Target: <94 cm (men), <80 cm (women)

5. **Imaging (DEXA/CT)** (5% of pillar)
   - Coronary calcium score - Target: 0
   - Visceral fat - Target: <100 cm²

#### **Calculation Methodology:**

```python
def calculate_cardiovascular_score(data):
    # Blood biomarkers (40%)
    ldl_c_score = score_range(data['ldl_c'], 0, 100, optimal=70, reverse=True)
    ldl_p_score = score_range(data['ldl_p'], 0, 1000, optimal=700, reverse=True)
    hdl_score = score_range(data['hdl'], 40, 80, optimal=60)
    hscrp_score = score_range(data['hscrp'], 0, 3, optimal=1.0, reverse=True)  # MOST IMPORTANT
    omega3_score = score_range(data['omega3_index'], 3, 10, optimal=5.4)
    trig_score = score_range(data['triglycerides'], 0, 200, optimal=150, reverse=True)
    
    blood_score = (
        ldl_c_score * 0.15 +
        ldl_p_score * 0.15 +
        hdl_score * 0.15 +
        hscrp_score * 0.25 +  # HIGHEST WEIGHT (most important)
        omega3_score * 0.15 +
        trig_score * 0.15
    )
    
    # Retinal AI (25%)
    retinal_score = data['retinal_ai_cv_risk']  # 0-100 from AI model
    
    # Wearable (20%)
    rhr_score = score_range(data['resting_hr'], 40, 80, optimal=55, reverse=True)
    hrv_score = score_range(data['hrv'], 20, 100, optimal=60, age_adjusted=True)
    vo2max_score = score_range(data['vo2max'], 20, 60, optimal=45, age_adjusted=True)
    
    wearable_score = (
        rhr_score * 0.3 +
        hrv_score * 0.4 +
        vo2max_score * 0.3
    )
    
    # Clinical (10%)
    bp_systolic_score = score_range(data['bp_systolic'], 90, 140, optimal=115, reverse=True)
    bp_diastolic_score = score_range(data['bp_diastolic'], 60, 90, optimal=75, reverse=True)
    bmi_score = score_range(data['bmi'], 18.5, 30, optimal=22)
    
    clinical_score = (
        bp_systolic_score * 0.4 +
        bp_diastolic_score * 0.4 +
        bmi_score * 0.2
    )
    
    # Imaging (5%)
    cac_score = score_range(data['coronary_calcium'], 0, 100, optimal=0, reverse=True)
    visceral_fat_score = score_range(data['visceral_fat'], 0, 200, optimal=100, reverse=True)
    
    imaging_score = (
        cac_score * 0.6 +
        visceral_fat_score * 0.4
    )
    
    # Final cardiovascular score
    cv_score = (
        blood_score * 0.40 +
        retinal_score * 0.25 +
        wearable_score * 0.20 +
        clinical_score * 0.10 +
        imaging_score * 0.05
    )
    
    return max(0, min(100, cv_score))
```

#### **Scoring Ranges:**

| Score Range | Rating | Description |
|------------|--------|-------------|
| 90-100 | Optimal | Bryan Johnson-tier, top 1% cardiovascular health |
| 80-89 | Excellent | Low CVD risk, excellent markers |
| 70-79 | Good | Moderate CVD risk, some optimization needed |
| 60-69 | Fair | Elevated CVD risk, lifestyle changes recommended |
| 50-59 | Poor | High CVD risk, medical intervention recommended |
| 0-49 | Critical | Very high CVD risk, immediate medical attention |

#### **Actionable Insights Examples:**

**Score 65/100 (Fair):**
- 🎯 **Top Priority:** Lower hsCRP from 2.5 to <1.0 mg/L (+15 points potential)
- 💡 **Action:** Anti-inflammatory diet, increase Omega-3 to 2g/day, reduce sugar
- 📊 **Impact:** hsCRP is "most important" biomarker, affects all-cause mortality

**Score 88/100 (Excellent):**
- 🎯 **Optimization:** Increase VO2 max from 42 to 48 mL/kg/min
- 💡 **Action:** Add HIIT 2x/week, increase cardio intensity
- 📊 **Impact:** +5 points, reach Bryan Johnson's fitness level

---

### **PILLAR 3: METABOLIC HEALTH SCORE (0-100) - 20% WEIGHT**

**What it measures:** Blood sugar control, insulin sensitivity, liver function, body composition

**Why #2 Biomarker Priority:**
- 27.3% of Bryan Johnson's tracked biomarkers
- Diabetes 20.7% prevalence in UAE (2.5x global average)
- Includes diet (8.3% of Bryan's daily time)
- Driver of CVD and cancer risk

#### **Data Sources (Hayat AI Multi-Modal):**

1. **Blood Biomarkers** (50% of pillar)
   - **HbA1c** (glycated hemoglobin) - Target: <5.2% (Bryan: 4.5%) **[KEY MARKER]**
   - **Fasting Insulin** - Target: <5 µIU/mL (Bryan: 3.0) **[EARLY WARNING]**
   - **Fasting Glucose** - Target: 70-100 mg/dL
   - **AST** (aspartate aminotransferase) - Target: <25 U/L (Bryan: 13)
   - **ALT** (alanine aminotransferase) - Target: <25 U/L (Bryan: 10)
   - Triglycerides - Target: <150 mg/dL
   - HOMA-IR (insulin resistance) - Target: <1.0
   - Uric acid - Target: <6.0 mg/dL

2. **Continuous Glucose Monitor (CGM)** (20% of pillar)
   - Average glucose - Target: 70-110 mg/dL
   - Glucose variability (SD) - Target: <20 mg/dL
   - Time in range (70-140) - Target: >90%
   - Post-meal spikes - Target: <140 mg/dL
   - Fasting glucose - Target: 70-100 mg/dL

3. **Body Composition (DEXA)** (15% of pillar)
   - Body fat percentage - Target: 10-20% (men), 18-28% (women)
   - Visceral fat - Target: <100 cm²
   - Lean muscle mass - Target: age/gender-adjusted
   - Bone density - Target: T-score >-1.0

4. **Genome Data** (10% of pillar)
   - Type 2 diabetes genetic risk
   - Insulin sensitivity genes
   - Fat metabolism genes
   - Carbohydrate metabolism genes

5. **Diet Tracking** (5% of pillar)
   - Caloric intake vs. RDA
   - Macronutrient balance
   - Meal timing (time-restricted eating)
   - Processed food consumption

#### **Calculation Methodology:**

```python
def calculate_metabolic_score(data):
    # Blood biomarkers (50%)
    hba1c_score = score_range(data['hba1c'], 4.0, 6.5, optimal=5.2, reverse=True)
    insulin_score = score_range(data['insulin'], 2, 10, optimal=5, reverse=True)
    glucose_score = score_range(data['fasting_glucose'], 70, 126, optimal=90, reverse=True)
    ast_score = score_range(data['ast'], 10, 40, optimal=25, reverse=True)
    alt_score = score_range(data['alt'], 10, 40, optimal=25, reverse=True)
    
    blood_score = (
        hba1c_score * 0.30 +  # KEY MARKER
        insulin_score * 0.30 +  # EARLY WARNING
        glucose_score * 0.20 +
        ast_score * 0.10 +
        alt_score * 0.10
    )
    
    # CGM (20%)
    avg_glucose_score = score_range(data['cgm_avg'], 70, 140, optimal=95)
    time_in_range_score = score_range(data['cgm_tir'], 70, 100, optimal=90)
    variability_score = score_range(data['cgm_sd'], 5, 30, optimal=15, reverse=True)
    
    cgm_score = (
        avg_glucose_score * 0.4 +
        time_in_range_score * 0.4 +
        variability_score * 0.2
    )
    
    # Body composition (15%)
    body_fat_score = score_range(data['body_fat_pct'], 8, 30, optimal=15, gender_adjusted=True)
    visceral_fat_score = score_range(data['visceral_fat'], 0, 200, optimal=100, reverse=True)
    muscle_mass_score = score_range(data['lean_mass'], 40, 80, optimal=60, age_gender_adjusted=True)
    
    body_comp_score = (
        body_fat_score * 0.4 +
        visceral_fat_score * 0.4 +
        muscle_mass_score * 0.2
    )
    
    # Genome (10%)
    genetic_risk_score = data['t2d_genetic_risk']  # 0-100 (reverse scored)
    
    # Diet (5%)
    diet_quality_score = data['diet_quality']  # 0-100 from tracking
    
    # Final metabolic score
    metabolic_score = (
        blood_score * 0.50 +
        cgm_score * 0.20 +
        body_comp_score * 0.15 +
        genetic_risk_score * 0.10 +
        diet_quality_score * 0.05
    )
    
    return max(0, min(100, metabolic_score))
```

#### **Scoring Ranges:**

| Score Range | Rating | Description |
|------------|--------|-------------|
| 90-100 | Optimal | Bryan Johnson-tier metabolic health |
| 80-89 | Excellent | Excellent insulin sensitivity, low diabetes risk |
| 70-79 | Good | Good metabolic health, minor optimization needed |
| 60-69 | Fair | Prediabetic range, lifestyle changes needed |
| 50-59 | Poor | High diabetes risk, medical intervention recommended |
| 0-49 | Critical | Diabetic range, immediate medical attention |

#### **Actionable Insights Examples:**

**Score 62/100 (Fair - Prediabetic):**
- 🎯 **Top Priority:** Lower HbA1c from 5.8% to <5.2% (+18 points potential)
- 💡 **Action:** Caloric restriction (10%), low-carb diet, walk after meals
- 📊 **Impact:** Reverse prediabetes, prevent Type 2 diabetes

**Score 85/100 (Excellent):**
- 🎯 **Optimization:** Reduce glucose variability from 22 to <15 mg/dL
- 💡 **Action:** Time-restricted eating (Bryan's 5.5-hour window), avoid processed carbs
- 📊 **Impact:** +5 points, reach Bryan's metabolic optimization

---

### **PILLAR 4: COGNITIVE HEALTH SCORE (0-100) - 10% WEIGHT**

**What it measures:** Brain function, memory, processing speed, dementia risk

**Why 10% Weight:**
- Not explicitly tracked in Bryan's 11 biomarkers (yet)
- Implied through sleep quality, inflammation control (hsCRP)
- Emerging area of focus (brain health = quality of life)
- Will increase weight when more direct measurement data available

#### **Data Sources (Hayat AI Multi-Modal):**

1. **Cognitive Assessments** (40% of pillar)
   - MoCA (Montreal Cognitive Assessment) - Target: >26/30
   - Memory tests (immediate/delayed recall)
   - Processing speed tests
   - Executive function tests
   - Attention/concentration tests

2. **Blood Biomarkers** (30% of pillar)
   - hsCRP (inflammation) - Target: <1.0 mg/L
   - Homocysteine - Target: <10 µmol/L
   - Vitamin B12 - Target: >400 pg/mL
   - Vitamin D - Target: >50 ng/mL (Bryan: 67.8)
   - Omega-3 Index - Target: >5.4%
   - HbA1c (glucose control) - Target: <5.2%

3. **Genome Data** (15% of pillar)
   - APOE4 status (Alzheimer's risk)
   - BDNF gene (brain-derived neurotrophic factor)
   - Other dementia risk genes

4. **Lifestyle Factors** (10% of pillar)
   - Sleep quality (from Sleep Score)
   - Physical activity level
   - Social engagement
   - Cognitive stimulation (learning, reading)
   - Stress management

5. **Brain Imaging (Optional)** (5% of pillar)
   - MRI brain volume
   - White matter lesions
   - Hippocampal volume

#### **Calculation Methodology:**

```python
def calculate_cognitive_score(data):
    # Cognitive assessments (40%)
    moca_score = score_range(data['moca'], 18, 30, optimal=26)
    memory_score = data['memory_test_score']  # 0-100
    processing_speed_score = data['processing_speed']  # 0-100
    executive_function_score = data['executive_function']  # 0-100
    
    assessment_score = (
        moca_score * 0.3 +
        memory_score * 0.3 +
        processing_speed_score * 0.2 +
        executive_function_score * 0.2
    )
    
    # Blood biomarkers (30%)
    hscrp_score = score_range(data['hscrp'], 0, 3, optimal=1.0, reverse=True)
    homocysteine_score = score_range(data['homocysteine'], 5, 15, optimal=10, reverse=True)
    b12_score = score_range(data['b12'], 200, 1000, optimal=400)
    vitd_score = score_range(data['vitamin_d'], 20, 80, optimal=50)
    omega3_score = score_range(data['omega3_index'], 3, 10, optimal=5.4)
    
    blood_score = (
        hscrp_score * 0.25 +
        homocysteine_score * 0.20 +
        b12_score * 0.20 +
        vitd_score * 0.20 +
        omega3_score * 0.15
    )
    
    # Genome (15%)
    genetic_risk_score = data['dementia_genetic_risk']  # 0-100 (reverse scored)
    
    # Lifestyle (10%)
    sleep_quality = data['sleep_score']  # From Sleep Pillar
    exercise_score = data['exercise_frequency']  # 0-100
    social_score = data['social_engagement']  # 0-100
    
    lifestyle_score = (
        sleep_quality * 0.5 +
        exercise_score * 0.3 +
        social_score * 0.2
    )
    
    # Brain imaging (5%) - optional
    imaging_score = data.get('brain_imaging_score', 75)  # Default 75 if not available
    
    # Final cognitive score
    cognitive_score = (
        assessment_score * 0.40 +
        blood_score * 0.30 +
        genetic_risk_score * 0.15 +
        lifestyle_score * 0.10 +
        imaging_score * 0.05
    )
    
    return max(0, min(100, cognitive_score))
```

#### **Scoring Ranges:**

| Score Range | Rating | Description |
|------------|--------|-------------|
| 90-100 | Optimal | Excellent cognitive function, low dementia risk |
| 80-89 | Excellent | Strong cognitive health, good memory |
| 70-79 | Good | Normal cognitive function for age |
| 60-69 | Fair | Mild cognitive concerns, preventive action recommended |
| 50-59 | Poor | Cognitive decline detected, medical evaluation needed |
| 0-49 | Critical | Significant cognitive impairment, immediate medical attention |

#### **Actionable Insights Examples:**

**Score 68/100 (Fair):**
- 🎯 **Top Priority:** Improve sleep quality from 65 to 85+ (+10 points potential)
- 💡 **Action:** Follow Bryan's sleep protocol (8:30 PM bedtime, wind-down routine)
- 📊 **Impact:** Sleep is foundation for cognitive health

**Score 82/100 (Excellent):**
- 🎯 **Optimization:** Lower homocysteine from 12 to <10 µmol/L
- 💡 **Action:** Increase B vitamins (B6, B12, folate)
- 📊 **Impact:** +3 points, reduce dementia risk

---

### **PILLAR 5: MENTAL HEALTH SCORE (0-100) - 10% WEIGHT**

**What it measures:** Mood, depression, anxiety, stress, emotional wellbeing

**Why 10% Weight:**
- Not explicitly tracked in Bryan's 11 biomarkers (yet)
- Implied through HRV, sleep quality, stress management
- Important for overall quality of life
- Will increase weight when more direct measurement data available

#### **Data Sources (Hayat AI Multi-Modal):**

1. **Questionnaires** (50% of pillar)
   - PHQ-9 (depression screening) - Target: <5
   - GAD-7 (anxiety screening) - Target: <5
   - PSS (Perceived Stress Scale) - Target: <14
   - WHO-5 Well-Being Index - Target: >50

2. **Wearable HRV Data** (25% of pillar)
   - Resting HRV - Target: >50 ms (age-adjusted)
   - HRV trend (improving vs. declining)
   - Stress detection (low HRV episodes)
   - Recovery score

3. **Lifestyle Factors** (15% of pillar)
   - Sleep quality (from Sleep Score)
   - Social connections
   - Work-life balance
   - Physical activity
   - Meditation/mindfulness practice

4. **Blood Biomarkers** (10% of pillar)
   - Cortisol (stress hormone) - Target: 6-23 µg/dL (morning)
   - Vitamin D - Target: >50 ng/mL
   - Omega-3 Index - Target: >5.4%
   - Magnesium - Target: 1.7-2.2 mg/dL

#### **Calculation Methodology:**

```python
def calculate_mental_health_score(data):
    # Questionnaires (50%)
    phq9_score = score_range(data['phq9'], 0, 27, optimal=5, reverse=True)
    gad7_score = score_range(data['gad7'], 0, 21, optimal=5, reverse=True)
    pss_score = score_range(data['pss'], 0, 40, optimal=14, reverse=True)
    who5_score = score_range(data['who5'], 0, 100, optimal=50)
    
    questionnaire_score = (
        phq9_score * 0.3 +
        gad7_score * 0.3 +
        pss_score * 0.2 +
        who5_score * 0.2
    )
    
    # HRV (25%)
    hrv_score = score_range(data['hrv'], 20, 100, optimal=60, age_adjusted=True)
    hrv_trend_score = data['hrv_trend']  # 0-100 (improving = higher)
    stress_episodes_score = score_range(data['stress_episodes'], 0, 10, optimal=2, reverse=True)
    
    hrv_component = (
        hrv_score * 0.5 +
        hrv_trend_score * 0.3 +
        stress_episodes_score * 0.2
    )
    
    # Lifestyle (15%)
    sleep_quality = data['sleep_score']  # From Sleep Pillar
    social_score = data['social_connections']  # 0-100
    work_life_balance = data['work_life_balance']  # 0-100
    
    lifestyle_score = (
        sleep_quality * 0.5 +
        social_score * 0.3 +
        work_life_balance * 0.2
    )
    
    # Blood biomarkers (10%)
    cortisol_score = score_range(data['cortisol'], 6, 30, optimal=15)
    vitd_score = score_range(data['vitamin_d'], 20, 80, optimal=50)
    omega3_score = score_range(data['omega3_index'], 3, 10, optimal=5.4)
    
    blood_score = (
        cortisol_score * 0.4 +
        vitd_score * 0.3 +
        omega3_score * 0.3
    )
    
    # Final mental health score
    mental_score = (
        questionnaire_score * 0.50 +
        hrv_component * 0.25 +
        lifestyle_score * 0.15 +
        blood_score * 0.10
    )
    
    return max(0, min(100, mental_score))
```

#### **Scoring Ranges:**

| Score Range | Rating | Description |
|------------|--------|-------------|
| 90-100 | Optimal | Excellent mental wellbeing, low stress |
| 80-89 | Excellent | Good mood, manageable stress |
| 70-79 | Good | Normal mental health, minor stress |
| 60-69 | Fair | Mild depression/anxiety, stress management needed |
| 50-59 | Poor | Moderate depression/anxiety, professional help recommended |
| 0-49 | Critical | Severe depression/anxiety, immediate professional help needed |

#### **Actionable Insights Examples:**

**Score 58/100 (Poor):**
- 🎯 **Top Priority:** Reduce PHQ-9 from 12 (moderate depression) to <5 (+20 points potential)
- 💡 **Action:** Seek professional help, improve sleep, increase exercise, social connection
- 📊 **Impact:** Depression affects physical health, all-cause mortality

**Score 78/100 (Good):**
- 🎯 **Optimization:** Improve HRV from 45 to 60+ ms
- 💡 **Action:** Daily meditation (10 min), stress management, improve sleep
- 📊 **Impact:** +8 points, better stress resilience

---

### **PILLAR 6: MICROBIOME HEALTH SCORE (0-100) - 10% WEIGHT**

**What it measures:** Gut microbiome diversity, oral microbiome, inflammation markers

**Why 10% Weight:**
- Not yet tracked by Bryan Johnson (but "coming soon" on Blueprint website)
- Emerging science with high preventive potential
- Affects all other systems (immune, metabolic, mental, cardiovascular)
- Will increase weight as more research emerges

#### **Data Sources (Hayat AI Multi-Modal):**

1. **Gut Microbiome Test** (50% of pillar)
   - Bacterial diversity (Shannon index) - Target: >3.5
   - Beneficial bacteria (Bifidobacterium, Lactobacillus, Akkermansia)
   - Pathogenic bacteria (low levels)
   - Short-chain fatty acids (SCFA) production
   - Firmicutes/Bacteroidetes ratio

2. **Oral Microbiome Test** (20% of pillar)
   - Periodontal bacteria levels
   - Cavity-causing bacteria
   - Oral inflammation markers
   - Plaque index

3. **Blood Inflammation Markers** (20% of pillar)
   - Zonulin (leaky gut marker) - Target: <50 ng/mL
   - LPS (lipopolysaccharide) - Target: low
   - hsCRP (systemic inflammation) - Target: <1.0 mg/L
   - Calprotectin (gut inflammation) - Target: <50 µg/g

4. **Diet Tracking** (10% of pillar)
   - Fiber intake - Target: >30g/day
   - Fermented foods - Target: daily
   - Processed food consumption - Target: minimal
   - Prebiotic/probiotic intake

#### **Calculation Methodology:**

```python
def calculate_microbiome_score(data):
    # Gut microbiome (50%)
    diversity_score = score_range(data['shannon_index'], 2.0, 5.0, optimal=3.5)
    beneficial_bacteria_score = data['beneficial_bacteria']  # 0-100
    pathogenic_bacteria_score = score_range(data['pathogenic_bacteria'], 0, 50, optimal=10, reverse=True)
    scfa_score = data['scfa_production']  # 0-100
    
    gut_score = (
        diversity_score * 0.3 +
        beneficial_bacteria_score * 0.3 +
        pathogenic_bacteria_score * 0.2 +
        scfa_score * 0.2
    )
    
    # Oral microbiome (20%)
    periodontal_score = data['periodontal_health']  # 0-100
    cavity_risk_score = score_range(data['cavity_bacteria'], 0, 100, optimal=20, reverse=True)
    
    oral_score = (
        periodontal_score * 0.6 +
        cavity_risk_score * 0.4
    )
    
    # Blood inflammation (20%)
    zonulin_score = score_range(data['zonulin'], 0, 100, optimal=50, reverse=True)
    lps_score = data['lps_score']  # 0-100 (reverse scored)
    hscrp_score = score_range(data['hscrp'], 0, 3, optimal=1.0, reverse=True)
    
    inflammation_score = (
        zonulin_score * 0.4 +
        lps_score * 0.3 +
        hscrp_score * 0.3
    )
    
    # Diet (10%)
    fiber_score = score_range(data['fiber_intake'], 10, 50, optimal=30)
    fermented_foods_score = data['fermented_foods']  # 0-100
    processed_food_score = score_range(data['processed_food'], 0, 50, optimal=10, reverse=True)
    
    diet_score = (
        fiber_score * 0.4 +
        fermented_foods_score * 0.3 +
        processed_food_score * 0.3
    )
    
    # Final microbiome score
    microbiome_score = (
        gut_score * 0.50 +
        oral_score * 0.20 +
        inflammation_score * 0.20 +
        diet_score * 0.10
    )
    
    return max(0, min(100, microbiome_score))
```

#### **Scoring Ranges:**

| Score Range | Rating | Description |
|------------|--------|-------------|
| 90-100 | Optimal | Excellent microbiome diversity, low inflammation |
| 80-89 | Excellent | Good gut health, beneficial bacteria dominant |
| 70-79 | Good | Adequate microbiome, minor optimization needed |
| 60-69 | Fair | Dysbiosis present, dietary changes recommended |
| 50-59 | Poor | Significant dysbiosis, probiotic intervention needed |
| 0-49 | Critical | Severe dysbiosis, medical evaluation needed |

#### **Actionable Insights Examples:**

**Score 62/100 (Fair):**
- 🎯 **Top Priority:** Increase gut diversity (Shannon 2.8 → 3.5+) (+18 points potential)
- 💡 **Action:** Increase fiber to 30g/day, add fermented foods, reduce processed food
- 📊 **Impact:** Gut health affects metabolism, immunity, mental health

**Score 84/100 (Excellent):**
- 🎯 **Optimization:** Improve oral microbiome (periodontal health)
- 💡 **Action:** Add waterpik, tongue scraper (Bryan's protocol)
- 📊 **Impact:** +5 points, reduce systemic inflammation

---

## 📈 **PREDICTIVE SCORING (12-18 MONTHS)**

### **"What If" Scenarios**

For each pillar, Hayat AI predicts future scores based on adherence to recommendations:

```python
def predict_future_score(current_score, adherence_level, timeframe_months):
    """
    Predict future health score based on adherence to recommendations
    
    Parameters:
    - current_score: Current pillar score (0-100)
    - adherence_level: 0.0 (0%) to 1.0 (100%)
    - timeframe_months: 12 or 18 months
    
    Returns:
    - predicted_score: Projected score (0-100)
    """
    
    # Calculate improvement potential
    max_improvement = 100 - current_score
    
    # Diminishing returns curve (harder to improve as you get better)
    if current_score >= 90:
        improvement_factor = 0.3
    elif current_score >= 80:
        improvement_factor = 0.5
    elif current_score >= 70:
        improvement_factor = 0.7
    else:
        improvement_factor = 0.9
    
    # Time factor (more improvement with more time)
    time_factor = 1.0 if timeframe_months == 12 else 1.3
    
    # Calculate predicted improvement
    predicted_improvement = (
        max_improvement * 
        adherence_level * 
        improvement_factor * 
        time_factor
    )
    
    predicted_score = current_score + predicted_improvement
    
    return min(100, predicted_score)
```

### **Example: Ahmed, 45-year-old Emirati male**

**Current Scores:**
```
HAYAT HEALTH SCORE: 68/100 (Fair)

Pillar Breakdown:
😴 Sleep:           55/100 (Poor) ⚠️
🫀 Cardiovascular:  85/100 (Optimal) ✅
🩸 Metabolic:       62/100 (Prediabetic) ⚠️
🧠 Cognitive:       78/100 (Good) ✅
😊 Mental:          70/100 (Fair) ⚠️
🦠 Microbiome:      68/100 (Fair) ⚠️
```

**Predictive Scoring (18 months, 100% adherence):**
```
PROJECTED SCORE: 87/100 (+19 points)

Pillar Projections:
😴 Sleep:           85/100 (+30 points) ⭐ BIGGEST OPPORTUNITY
🫀 Cardiovascular:  92/100 (+7 points)
🩸 Metabolic:       82/100 (+20 points) ⭐ SECOND BIGGEST
😊 Mental:          85/100 (+15 points)
🦠 Microbiome:      80/100 (+12 points)
🧠 Cognitive:       82/100 (+4 points)
```

**Top 3 Actions (Prioritized by Impact):**
1. **Improve sleep:** 55 → 85 (+30 points possible) - Follow Bryan's protocol
2. **Reduce HbA1c:** 62 → 82 (+20 points possible) - Caloric restriction, low-carb, exercise
3. **Manage stress:** 70 → 85 (+15 points possible) - Meditation, work-life balance

---

## 🇦🇪 **UAE-SPECIFIC CUSTOMIZATION**

### **Population Norms Adjustment**

Scores are adjusted for UAE population data:

```python
def adjust_for_uae_population(raw_score, biomarker, age, gender, ethnicity):
    """
    Adjust score based on UAE population norms
    """
    
    # Emirati-specific thresholds
    if ethnicity == "Emirati":
        # Higher diabetes prevalence (24-25% vs. 20.7% total UAE)
        if biomarker == "HbA1c":
            threshold_adjustment = 0.1  # Slightly more lenient threshold
        
        # Higher CVD risk
        elif biomarker == "LDL-C":
            threshold_adjustment = -5  # Stricter threshold
    
    # Age/gender adjustments
    age_factor = calculate_age_factor(age, biomarker)
    gender_factor = calculate_gender_factor(gender, biomarker)
    
    adjusted_score = raw_score * age_factor * gender_factor + threshold_adjustment
    
    return max(0, min(100, adjusted_score))
```

### **Ramadan Awareness**

During Ramadan, scores account for fasting effects:

```python
def ramadan_adjustment(score, pillar, ramadan_active=False):
    """
    Adjust scores during Ramadan fasting period
    """
    
    if not ramadan_active:
        return score
    
    # Sleep patterns change during Ramadan
    if pillar == "Sleep":
        # Account for Taraweeh prayers, later bedtime
        score_adjustment = -5  # Temporary reduction expected
    
    # Metabolic changes during fasting
    elif pillar == "Metabolic":
        # Fasting can improve insulin sensitivity
        score_adjustment = +3
    
    # Mental health may be affected
    elif pillar == "Mental":
        # Spiritual benefits vs. sleep disruption
        score_adjustment = 0  # Neutral
    
    return score + score_adjustment
```

### **Cultural Factors**

- **Halal nutrition recommendations**
- **Arabic language support**
- **Family-oriented health goals**
- **Prayer time considerations**
- **Cultural stress factors (work, family expectations)**

---

## ✅ **VALIDATION & ACCURACY**

### **How We Ensure Accuracy:**

1. **Clinical Validation**
   - All biomarker thresholds based on clinical guidelines
   - Reviewed by medical advisory board
   - Aligned with WHO, AHA, ADA, IDF standards

2. **Population Validation**
   - UAE-specific data from UNDP, IDF, PMC studies
   - Emirati population norms from UAE Genome Database
   - Age/gender/ethnicity adjustments validated

3. **Algorithm Validation**
   - Tested against known health outcomes
   - Correlation with all-cause mortality data
   - Sensitivity analysis for each biomarker weight

4. **User Feedback Loop**
   - Continuous improvement based on user outcomes
   - A/B testing of recommendation effectiveness
   - Longitudinal tracking of score changes

---

## 📚 **SCIENTIFIC REFERENCES**

### **Sleep:**
1. Walker, M. (2017). Why We Sleep. Scribner.
2. Cappuccio, F. P., et al. (2010). Sleep duration and all-cause mortality. Sleep, 33(5), 585-592.
3. Bryan Johnson Blueprint Protocol (2025)

### **Cardiovascular:**
1. American Heart Association Guidelines (2024)
2. hsCRP and mortality: Ridker, P. M., et al. (2002). NEJM, 347(20), 1557-1565.
3. Bryan Johnson: 11 Biomarkers (Dr. Mike Mallin, Don't Die Summit)

### **Metabolic:**
1. International Diabetes Federation (2024). IDF Diabetes Atlas.
2. HbA1c and mortality: Selvin, E., et al. (2010). NEJM, 362(9), 800-811.
3. UAE Diabetes Statistics (2024)

### **Cognitive:**
4. Livingston, G., et al. (2020). Dementia prevention, intervention, and care. Lancet, 396(10248), 413-446.

### **Mental Health:**
5. Kroenke, K., et al. (2001). PHQ-9 validation. J Gen Intern Med, 16(9), 606-613.

### **Microbiome:**
6. Valdes, A. M., et al. (2018). Role of the gut microbiota in nutrition and health. BMJ, 361, k2179.

---

## 🚀 **IMPLEMENTATION ROADMAP**

### **Phase 1: MVP (Months 1-3)**
Focus on Bryan's top priorities (70% coverage):
- ✅ Sleep Score (25%) - Wearable data, HRV
- ✅ Cardiovascular Score (25%) - Blood biomarkers, BP, retinal AI
- ✅ Metabolic Score (20%) - HbA1c, insulin, DEXA

### **Phase 2: Expansion (Months 4-6)**
Add secondary priorities (90% coverage):
- ✅ Cognitive Score (10%) - Assessments, blood
- ✅ Mental Health Score (10%) - Questionnaires, HRV

### **Phase 3: Advanced (Months 7-12)**
Complete system (100% coverage):
- ✅ Microbiome Score (10%) - Gut/oral tests, inflammation

---

## 📊 **COMPARISON: V1.0 vs. V2.0**

| Aspect | V1.0 (Original) | V2.0 (Blueprint-Optimized) |
|--------|----------------|---------------------------|
| **Sleep Weight** | 15% | **25%** (+10%) |
| **CV Weight** | 25% | 25% (no change) |
| **Metabolic Weight** | 20% | 20% (no change) |
| **Cognitive Weight** | 15% | **10%** (-5%) |
| **Mental Weight** | 15% | **10%** (-5%) |
| **Microbiome Weight** | 10% | 10% (no change) |
| **Evidence Base** | General health science | **Bryan Johnson's proven protocol** |
| **Time Investment** | Not considered | **Aligned with 41.7% sleep time** |
| **Biomarker Priority** | Equal weighting | **Aligned with 36.4% CV biomarkers** |
| **Validation** | Literature-based | **Real-world results (5-year biological age reversal)** |

---

## 🎯 **FINAL RECOMMENDATION**

**Adopt V2.0 (Blueprint-Optimized) weighting system for Hayat AI.**

**Rationale:**
1. **Evidence-based:** Bryan Johnson has achieved measurable results (5-year biological age reversal)
2. **Time-tested:** 3+ years of rigorous protocol optimization
3. **Data-driven:** Based on 11 biomarkers tracked religiously
4. **Explicit priorities:** Sleep #1, Exercise #2, Diet #3 (cascading system)
5. **UAE-relevant:** Addresses top killers (CVD 40%, Diabetes 20.7%, Cancer 12%)

**Expected Impact:**
- Stronger user engagement (sleep is relatable #1 priority)
- Better health outcomes (focus on highest-impact pillars)
- Competitive differentiation (Blueprint-inspired, UAE-customized)
- Scalable measurement (70% coverage in MVP phase)

---

**End of Framework V2.0**

